// employee/static/employee/js/call-modal.js

document.addEventListener('DOMContentLoaded', function() {
    // Global variables
    let callStartTime = null;
    const csrfToken = document.querySelector('[name=csrfmiddlewaretoken]').value;

    // Make functions globally accessible
    window.openModal = function() {
        const modal = document.getElementById('clientCallModal');
        if (modal) {
            modal.classList.remove('hidden');
            document.body.style.overflow = 'hidden';
            startNewCall();
        }
    };

    window.closeModal = function() {
        const modal = document.getElementById('clientCallModal');
        if (modal) {
            modal.classList.add('hidden');
            document.body.style.overflow = 'auto';
            resetForms();
            resetModal();
            endNewCall();
        }
    };

    window.showSection = function(type) {
        const newQuerySection = document.getElementById('newQuerySection');
        const existingQuerySection = document.getElementById('existingQuerySection');

        // Reset all circles
        document.querySelectorAll('.query-circle').forEach(circle => {
            circle.classList.remove('bg-blue-500');
        });

        // Get clicked button's circle and activate it
        const clickedButton = event.currentTarget;
        const circle = clickedButton.querySelector('.query-circle');
        circle.classList.add('bg-blue-500');

        // Show/hide sections
        if (newQuerySection) newQuerySection.style.display = type === 'new' ? 'block' : 'none';
        if (existingQuerySection) existingQuerySection.style.display = type === 'existing' ? 'block' : 'none';
    };

    function resetForms() {
        // Reset New Query Form
        const newQueryForm = document.getElementById('newQueryForm');
        if (newQueryForm) {
            newQueryForm.reset();

            // Reset create ticket toggle and email fields
            const createTicketToggle = document.getElementById('create_ticket');
            const emailFields = document.getElementById('emailFields');
            if (createTicketToggle && emailFields) {
                createTicketToggle.checked = false;
                emailFields.classList.add('hidden');
            }

            // Reset submit button
            const submitBtn = document.getElementById('newQuerySubmitBtn');
            if (submitBtn) {
                submitBtn.textContent = 'Save';
                submitBtn.classList.remove('bg-green-600', 'hover:bg-green-700');
                submitBtn.classList.add('bg-blue-600', 'hover:bg-blue-700');
            }
        }

        // Reset Existing Query Form
        const existingQueryForm = document.getElementById('existingQueryForm');
        if (existingQueryForm) {
            existingQueryForm.reset();

            // Hide ticket details
            const ticketDetails = document.getElementById('ticket-details');
            if (ticketDetails) {
                ticketDetails.classList.add('hidden');
            }
        }

        // Hide both sections
        const newQuerySection = document.getElementById('newQuerySection');
        const existingQuerySection = document.getElementById('existingQuerySection');
        if (newQuerySection) newQuerySection.classList.add('hidden');
        if (existingQuerySection) existingQuerySection.classList.add('hidden');
    }

    function resetModal() {
        // Hide both form sections
        const newQuerySection = document.getElementById('newQuerySection');
        const existingQuerySection = document.getElementById('existingQuerySection');
        if (newQuerySection) newQuerySection.classList.add('hidden');
        if (existingQuerySection) existingQuerySection.classList.add('hidden');

        // Reset circles
        document.querySelectorAll('.query-circle').forEach(circle => {
            circle.classList.remove('bg-blue-500');
        });

        // Reset all form inputs
        const allForms = document.querySelectorAll('form');
        allForms.forEach(form => form.reset());

        // Reset create ticket toggle and email fields
        const createTicketToggle = document.getElementById('create_ticket');
        const emailFields = document.getElementById('emailFields');
        if (createTicketToggle && emailFields) {
            createTicketToggle.checked = false;
            emailFields.classList.add('hidden');
        }

        // Reset submit button
        const submitBtn = document.getElementById('newQuerySubmitBtn');
        if (submitBtn) {
            submitBtn.textContent = 'Save';
            submitBtn.classList.remove('bg-green-600', 'hover:bg-green-700');
            submitBtn.classList.add('bg-blue-600', 'hover:bg-blue-700');
        }

        // Hide ticket details
        const ticketDetails = document.getElementById('ticket-details');
        if (ticketDetails) {
            ticketDetails.classList.add('hidden');
        }
    }

    // Timer Functions
    function startNewCall() {
        fetch('/start-new-call/', {
            method: 'POST',
            headers: {
                'X-CSRFToken': csrfToken,
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                callStartTime = new Date(data.call_start_time);
                console.log('Call started successfully');
            }
        })
        .catch(error => console.error('Error starting call:', error));
    }

    function endNewCall() {
        if (!callStartTime) return;

        fetch('/end-new-call/', {
            method: 'POST',
            headers: {
                'X-CSRFToken': csrfToken,
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                callStartTime = null;
                console.log('Call ended successfully');
            }
        })
        .catch(error => console.error('Error ending call:', error));
    }

    // Table Functions
    function loadCallQueries() {
        fetch('/get-call-queries/')
            .then(response => response.json())
            .then(data => {
                const tbody = document.getElementById('newQueriesBody');
                if (!tbody) return;

                tbody.innerHTML = '';

                if (!data.new_queries || data.new_queries.length === 0) {
                    // Add empty state row
                    const emptyRow = document.createElement('tr');
                    emptyRow.className = "empty-state-row";
                    emptyRow.innerHTML = `
                        <td colspan="5" class="py-16">
                            <div class="flex flex-col items-center justify-center text-gray-500">
                                <svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>
                                <p class="text-xl font-semibold mb-2">No Call Details Available</p>
                                <p class="text-sm">There are no recent calls to display.</p>
                            </div>
                        </td>
                    `;
                    tbody.appendChild(emptyRow);
                } else {
                    // Add data rows
                    data.new_queries.forEach(query => {
                        const row = document.createElement('tr');
                        row.className = "border-b border-gray-200 hover:bg-gray-100";
                        row.innerHTML = `
                            <th scope="row" class="px-6 py-4 w-4 font-medium whitespace-nowrap border">
                                ${query.client_name}
                            </th>
                            <td class="px-6 py-4 w-5 text-center border">
                                ${query.client_email || '-'}
                            </td>
                            <td class="px-6 py-4 w-4 text-center border">
                                ${query.call_duration || '-'}
                            </td>
                            <td class="px-6 py-4 w-4 text-center border">
                                ${query.ticket_created ? '✅' : '❌'}
                            </td>
                            <td class="px-6 py-4 text-left border note-cell">
                                <div class="truncate-text" title="${query.note}">
                                    ${query.note}
                                </div>
                            </td>
                        `;
                        tbody.appendChild(row);
                    });
                }
            })
            .catch(error => {
                console.error('Error loading queries:', error);
                const tbody = document.getElementById('newQueriesBody');
                if (!tbody) return;

                tbody.innerHTML = `
                    <tr class="empty-state-row">
                        <td colspan="5" class="py-16">
                            <div class="flex flex-col items-center justify-center text-gray-500">
                                <svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path>
                                </svg>
                                <p class="text-xl font-semibold mb-2 text-red-500">Error Loading Call Details</p>
                                <p class="text-sm">Please try again later or contact support.</p>
                            </div>
                        </td>
                    </tr>
                `;
            });
    }

    // Initialize elements and event listeners
    const modal = document.getElementById('clientCallModal');
    const createTicketToggle = document.getElementById('create_ticket');
    const emailFields = document.getElementById('emailFields');
    const searchButton = document.getElementById('search-ticket');

    // Modal event listeners
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') closeModal();
    });

    if (modal) {
        modal.addEventListener('click', function(e) {
            if (e.target === this) {
                modal.classList.add('hidden');
                document.body.style.overflow = 'auto';
            }
        });
    }

    // Prevent form submission on enter key for ticket search
    const ticketIdInput = document.getElementById('ticket-id');
    if (ticketIdInput) {
        ticketIdInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('search-ticket')?.click();
            }
        });
    }

    // Create ticket toggle handler
    if (createTicketToggle) {
        createTicketToggle.addEventListener('change', function() {
            const submitBtn = document.getElementById('newQuerySubmitBtn');
            if (submitBtn) {
                submitBtn.textContent = this.checked ? 'Send' : 'Save';
                if (this.checked) {
                    submitBtn.classList.remove('bg-blue-600', 'hover:bg-blue-700');
                    submitBtn.classList.add('bg-green-600', 'hover:bg-green-700');
                } else {
                    submitBtn.classList.remove('bg-green-600', 'hover:bg-green-700');
                    submitBtn.classList.add('bg-blue-600', 'hover:bg-blue-700');
                }
            }

            if (emailFields) {
                if (this.checked) {
                    emailFields.classList.remove('hidden');
                    const clientEmailInput = document.getElementById('client_email');
                    if (clientEmailInput) {
                        clientEmailInput.required = true;
                    }
                } else {
                    emailFields.classList.add('hidden');
                    const clientEmailInput = document.getElementById('client_email');
                    if (clientEmailInput) {
                        clientEmailInput.required = false;
                        clientEmailInput.value = '';
                        document.getElementById('cc_email').value = '';
                    }
                }
            }
        });
    }

    // Search ticket handler
    if (searchButton) {
        searchButton.addEventListener('click', function() {
            const ticketId = document.getElementById('ticket-id').value;
            if (!ticketId) {
                alert('Please enter a ticket ID');
                return;
            }

            this.disabled = true;
            this.innerHTML = `
                <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>`;

            fetch(`/tickets/search/${ticketId}/`, {
                method: 'GET',
                headers: { 'X-CSRFToken': csrfToken }
            })
            .then(response => response.json())
            .then(data => {
                this.disabled = false;
                this.textContent = 'Search';

                const ticketDetails = document.getElementById('ticket-details');
                if (data.success) {
                    ticketDetails.style.display = 'block';
                    document.getElementById('subject').value = data.ticket.subject;
                    document.getElementById('priority').value = data.ticket.priority;

                    const assignedToDropdown = document.getElementById('assigned-to');
                    assignedToDropdown.innerHTML = '';
                    data.users.forEach(user => {
                        const option = document.createElement('option');
                        option.value = user.id;
                        option.textContent = user.username;
                        option.selected = user.id == data.ticket.assigned_to;
                        assignedToDropdown.appendChild(option);
                    });

                    document.getElementById('client_call_note').value = data.ticket.note || '';
                } else {
                    alert('Ticket not found');
                    ticketDetails.style.display = 'none';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                this.disabled = false;
                this.textContent = 'Search';
                alert('Error searching for ticket');
            });
        });
    }

    // Form submission handlers
    const newQueryForm = document.getElementById('newQueryForm');
    if (newQueryForm) {
        newQueryForm.addEventListener('submit', async function(e) {
            e.preventDefault();

            try {
                const endCallResponse = await fetch('/end-new-call/', {
                    method: 'POST',
                    headers: {
                        'X-CSRFToken': csrfToken,
                        'Content-Type': 'application/json'
                    }
                }).then(response => response.json());

                if (endCallResponse.status === 'success') {
                    const formData = new FormData(this);
                    if (endCallResponse.call_duration) {
                        formData.append('call_duration_seconds', endCallResponse.call_duration);
                    }

                    const saveResponse = await fetch('/save-new-call-query/', {
                        method: 'POST',
                        headers: { 'X-CSRFToken': csrfToken },
                        body: formData
                    }).then(response => response.json());

                    if (saveResponse.status === 'success') {
                        alert('Call query saved successfully');
                        closeModal();
                        loadCallQueries();
                        window.location.reload();
                    } else {
                        throw new Error('Failed to save call query');
                    }
                }
            } catch (error) {
                console.error('Error:', error);
                alert('Error saving call query');
            }
        });
    }

    const existingQueryForm = document.getElementById('existingQueryForm');
    if (existingQueryForm) {
        existingQueryForm.addEventListener('submit', async function(e) {
            e.preventDefault();

            try {
                const endCallResponse = await fetch('/end-new-call/', {
                    method: 'POST',
                    headers: {
                        'X-CSRFToken': csrfToken,
                        'Content-Type': 'application/json'
                    }
                }).then(response => response.json());

                const formData = new FormData(this);
                if (endCallResponse.status === 'success' && endCallResponse.call_duration) {
                    formData.append('call_duration_seconds', endCallResponse.call_duration);
                }

                const ticketId = document.getElementById('ticket-id').value;
                const updateResponse = await fetch(`/tickets/update/${ticketId}/`, {
                    method: 'POST',
                    headers: { 'X-CSRFToken': csrfToken },
                    body: formData
                }).then(response => response.json());

                if (updateResponse.success) {
                    alert('Ticket updated successfully');
                    closeModal();
                    window.location.reload();
                } else {
                    throw new Error('Failed to update ticket');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('Error updating ticket');
            }
        });
    }

    // Note form submission handler
    const noteForm = document.getElementById('noteForm');
    if (noteForm) {
        noteForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const formData = new FormData(this);

            fetch('/save-call-note/', {
                method: 'POST',
                body: formData,
                headers: {
                    'X-CSRFToken': formData.get('csrfmiddlewaretoken'),
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert(data.message);
                    closeModal();
                } else {
                    alert(data.message);
                }
            })
            .catch(error => console.error('Error:', error));
        });
    }

    // Initialize the queries table
    loadCallQueries();
});