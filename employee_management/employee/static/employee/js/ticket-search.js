document.addEventListener('DOMContentLoaded', function() {
    // Move all your initialization code here
    const searchInput = document.getElementById('search-ticket-id');
    if (searchInput) {
        searchInput.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                searchTicket();
            }
        });
    }

    // Keep these functions global
    window.openSearchModal = openSearchModal;
    window.closeSearchModal = closeSearchModal;
    window.searchTicket = searchTicket;
    window.updateTicket = updateTicket;
});

// Define your functions outside
function openSearchModal() {
    document.getElementById('searchTicketModal').classList.remove('hidden');
}

function closeSearchModal() {
    const modal = document.getElementById('searchTicketModal');
    modal.classList.add('hidden');
    document.getElementById('search-ticket-details').classList.add('hidden');
    document.getElementById('searchTicketForm').reset();
}

function searchTicket() {
    const ticketId = document.getElementById('search-ticket-id').value;
    const searchInput = document.getElementById('search-ticket-id');

    // Check if there's an active timer or call
    if (window.ticketActions && window.ticketActions.checkTicketActivity(ticketId)) {
        Swal.fire({
            title: 'Active Session',
            text: 'This ticket has an active timer or call. Please stop the timer and end any ongoing calls before making updates.',
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Ok'
        });
        return;
    }

    // Add loading state
    searchInput.classList.add('opacity-50');
    searchInput.disabled = true;

    fetch(`/tickets/search_new/${ticketId}/`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const detailsSection = document.getElementById('search-ticket-details');
                detailsSection.style.opacity = '0';
                detailsSection.classList.remove('hidden');

                // Fill in the data
                document.getElementById('search-subject').value = data.ticket.subject;
                document.getElementById('search-priority').value = data.ticket.priority;
                document.getElementById('search-status').value = data.ticket.status;
                document.getElementById('search-group').value = data.ticket.group;

                // Animate in
                setTimeout(() => {
                    detailsSection.style.opacity = '1';
                }, 50);
            } else {
                Swal.fire({
                    title: 'Error',
                    text: data.message,
                    icon: 'error',
                    customClass: {
                        popup: 'animated fadeInDown faster'
                    }
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            Swal.fire({
                title: 'Error',
                text: 'Failed to fetch ticket details',
                icon: 'error'
            });
        })
        .finally(() => {
            // Remove loading state
            searchInput.classList.remove('opacity-50');
            searchInput.disabled = false;
        });
}

function updateTicket() {
    const ticketId = document.getElementById('search-ticket-id').value;

    // Check if there's an active timer or call
    if (window.ticketActions && window.ticketActions.checkTicketActivity(ticketId)) {
        Swal.fire({
            title: 'Active Session',
            text: 'This ticket has an active timer or call. Please stop the timer and end any ongoing calls before making updates.',
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Ok'
        });
        return;
    }

    const updateBtn = document.querySelector('.update-btn');
    const formData = new FormData();

    // Disable button and show loading state
    updateBtn.disabled = true;
    updateBtn.innerHTML = `
        <svg class="animate-spin -ml-1 mr-2 h-4 w-4 text-white inline-block" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
        </svg>
        Updating...
    `;

    formData.append('priority', document.getElementById('search-priority').value);
    formData.append('status', document.getElementById('search-status').value);
    formData.append('group', document.getElementById('search-group').value);

    fetch(`/tickets/update_new/${ticketId}/`, {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
        }
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // First close the modal
            closeSearchModal();

            // Show success toast notification and reload
            Swal.fire({
                title: 'Success!',
                text: 'Ticket updated successfully!',
                icon: 'success',
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true,
                customClass: {
                    popup: 'bg-white rounded-lg shadow-xl p-4',
                    title: 'text-lg font-semibold text-gray-800',
                    content: 'text-gray-600'
                }
            }).then(() => {
                window.location.reload();
            });
        } else {
            // Show error toast
            Swal.fire({
                title: 'Error!',
                text: data.message || 'Failed to update ticket.',
                icon: 'error',
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                customClass: {
                    popup: 'bg-white rounded-lg shadow-xl',
                    title: 'text-lg font-semibold text-red-600',
                    content: 'text-gray-600'
                }
            });
        }
    })
    .catch(error => {
        console.error('Error:', error);
        Swal.fire({
            title: 'Error!',
            text: 'Failed to update ticket.',
            icon: 'error',
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 2000,
            customClass: {
                popup: 'bg-white rounded-lg shadow-xl',
                title: 'text-lg font-semibold text-red-600',
                content: 'text-gray-600'
            }
        });
    })
    .finally(() => {
        // Reset button state
        updateBtn.disabled = false;
        updateBtn.innerHTML = 'Update Ticket';
    });
}