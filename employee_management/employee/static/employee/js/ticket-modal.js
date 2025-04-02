// static/js/ticket-modal.js
function openCreateTicketModal() {
    const modal = document.getElementById('createTicketModal');

    // Fetch form content
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
        modal.classList.remove('hidden');
    });
}

function closeCreateTicketModal() {
    document.getElementById('createTicketModal').classList.add('hidden');
}

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

// Close modal when clicking outside
document.addEventListener('click', function(e) {
    const modal = document.getElementById('createTicketModal');
    if (e.target === modal) {
        closeCreateTicketModal();
    }
});