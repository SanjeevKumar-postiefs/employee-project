// employee/static/employee/js/ticket-modal.js
document.addEventListener('DOMContentLoaded', function() {
    // Initialize formLoaded flag
    let formLoaded = false;

    // Make functions globally accessible
    window.openCreateTicketModal = function() {
        const modal = document.getElementById('createTicketModal');

        // Only fetch form content if it hasn't been loaded or was cleared
        if (!formLoaded) {
            fetch('/create-ticket/', {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('createTicketForm').innerHTML = data.html;
                initializeFormHandlers(data.employees);
                formLoaded = true;
            });
        }

        modal.classList.remove('hidden');
    };

    window.closeCreateTicketModal = function() {
        const modal = document.getElementById('createTicketModal');
        modal.classList.add('hidden');

        // Clear the form and reset formLoaded flag
        const form = document.getElementById('createTicketForm');
        if (form) {
            form.reset();
            const assignedToSelect = document.getElementById('id_assigned_to');
            if (assignedToSelect) {
                assignedToSelect.innerHTML = '<option value="">Assign to</option>';
            }
            formLoaded = false; // Reset the form loaded flag
        }
    };

    function initializeFormHandlers(employees) {
        const form = document.getElementById('createTicketForm');
        const groupSelect = document.getElementById('id_group');
        const assignedToSelect = document.getElementById('id_assigned_to');

        if (groupSelect && assignedToSelect) {
            groupSelect.addEventListener('change', function() {
                const selectedGroup = this.value;
                populateUsersByGroup(selectedGroup, employees, assignedToSelect);
            });
        }

        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const formData = new FormData(this);
            fetch('/create-ticket/', {
                method: 'POST',
                body: formData,
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: 'Ticket created successfully',
                        timer: 1500
                    }).then(() => {
                        closeCreateTicketModal();
                        window.location.reload();
                    });
                }
            });
        });
    }

    function populateUsersByGroup(group, employees, assignedToSelect) {
        assignedToSelect.innerHTML = '<option value="">Assign to</option>';
        employees.forEach(function(employee) {
            if (employee.employeeprofile__skill === group) {
                const option = document.createElement('option');
                option.value = employee.id;
                option.textContent = employee.username;
                assignedToSelect.appendChild(option);
            }
        });
    }

    // Initialize modal events
    const modal = document.getElementById('createTicketModal');
    if (modal) {
        // Handle outside clicks
        modal.addEventListener('click', function(e) {
            if (e.target === this) {
                // Just hide the modal without clearing
                this.classList.add('hidden');
            }
        });

        // Ensure click events inside the modal don't trigger the outside click handler
        const modalContent = modal.querySelector('.relative');
        if (modalContent) {
            modalContent.addEventListener('click', function(e) {
                e.stopPropagation();
            });
        }
    }
});