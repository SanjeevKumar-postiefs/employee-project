class TicketUpdater {
    constructor() {
        this.lastUpdate = new Date();
        this.updateInterval = 30000; // 30 seconds
        this.isUpdating = false;
        this.ticketsTable = document.querySelector('table tbody');
        this.init();
    }

    init() {
        this.startPolling();
    }

    startPolling() {
        setInterval(() => this.checkForNewTickets(), this.updateInterval);
    }

    async checkForNewTickets() {
        if (this.isUpdating) return;
        this.isUpdating = true;

        try {
            const response = await fetch('/get-new-tickets/');
            const data = await response.json();
            this.updateTicketsTable(data.tickets);
        } catch (error) {
            console.error('Error fetching new tickets:', error);
        } finally {
            this.isUpdating = false;
        }
    }

    updateTicketsTable(newTickets) {
        // Store existing ticket IDs
        const existingTicketIds = new Set();
        const rows = this.ticketsTable.querySelectorAll('tr[data-ticket-id]');
        rows.forEach(row => {
            existingTicketIds.add(row.getAttribute('data-ticket-id'));
        });

        newTickets.forEach(ticket => {
            if (!existingTicketIds.has(ticket.id.toString())) {
                // This is a new ticket - insert it at the top
                this.insertNewTicketRow(ticket);
            } else {
                // Update existing ticket
                this.updateExistingTicketRow(ticket);
            }
        });

        // Remove tickets that no longer exist in the new data
        const newTicketIds = new Set(newTickets.map(t => t.id.toString()));
        rows.forEach(row => {
            const ticketId = row.getAttribute('data-ticket-id');
            if (!newTicketIds.has(ticketId)) {
                const expandedRow = document.getElementById(`expanded-row-${ticketId}`);
                if (expandedRow) expandedRow.remove();
                row.remove();
            }
        });
    }

    insertNewTicketRow(ticket) {
        const template = this.createTicketRowHTML(ticket);
        const firstRow = this.ticketsTable.querySelector('tr');
        if (firstRow) {
            firstRow.insertAdjacentHTML('beforebegin', template);
        } else {
            this.ticketsTable.innerHTML = template;
        }

        // Initialize event listeners for the new row
        this.initializeRowEventListeners(ticket.id);
    }

    updateExistingTicketRow(ticket) {
        const row = this.ticketsTable.querySelector(`tr[data-ticket-id="${ticket.id}"]`);
        if (!row) return;

        // Update status cell
        const statusCell = row.querySelector('td[data-status]');
        if (statusCell) {
            statusCell.setAttribute('data-status', ticket.status.toLowerCase());
            statusCell.textContent = ticket.status_abbreviation;
        }

        // Update priority cell
        const priorityCell = row.querySelector('td[data-priority]');
        if (priorityCell) {
            priorityCell.setAttribute('data-priority', ticket.priority.toLowerCase());
            priorityCell.textContent = ticket.priority;
        }

        // Update basic fields
        row.querySelector('td:nth-child(2)').textContent = ticket.ticket_id;
        row.querySelector('td:nth-child(3)').textContent = ticket.subject;

        // Update created timer
        const createdTimer = row.querySelector(`#created-timer-${ticket.id}`);
        if (createdTimer) {
            createdTimer.setAttribute('data-created-at', ticket.created_at);
            createdTimer.setAttribute('data-status', ticket.status);
            createdTimer.setAttribute('data-priority', ticket.priority.toLowerCase());
            createdTimer.textContent = ticket.time_since_created;
            createdTimer.title = `Created: ${new Date(ticket.created_at).toLocaleString()}`;
        }

        // Update timer spans
        const totalTimer = row.querySelector(`#timer-${ticket.id}`);
        if (totalTimer) {
            totalTimer.textContent = ticket.time_spent;
            const timeColumn = totalTimer.closest('.time-column');
            if (timeColumn) {
                if (ticket.has_exceeded_time_limit) {
                    timeColumn.classList.add(`priority-${ticket.priority.toLowerCase()}`);
                } else {
                    timeColumn.classList.remove(`priority-${ticket.priority.toLowerCase()}`);
                }
            }
        }

        const individualTimer = row.querySelector(`#individual-timer-${ticket.id}`);
        if (individualTimer) {
            individualTimer.textContent = ticket.individual_time_spent;
            const timeColumn = individualTimer.closest('.time-column');
            if (timeColumn) {
                if (ticket.has_exceeded_time_limit && !ticket.status_changed) {
                    timeColumn.classList.add('exceeded', `priority-${ticket.priority.toLowerCase()}`);
                } else {
                    timeColumn.classList.remove('exceeded', `priority-${ticket.priority.toLowerCase()}`);
                }
            }
        }

        // Update action buttons
        const startButton = row.querySelector('.start-button');
        if (startButton) {
            startButton.textContent = ticket.is_active ? 'Stop' : 'Start';
        }

        // Update acknowledge button
        const acknowledgeCell = row.querySelector('td:last-child');
        if (acknowledgeCell) {
            if (ticket.is_acknowledged) {
                acknowledgeCell.innerHTML = '<span class="text-success">✅</span>';
            }
        }
    }

    createTicketRowHTML(ticket) {
        return `
            <tr><td colspan="11" class="h-1"></td></tr>
            <tr class="border border-l-4 border-blue-500 bg-gray-100 hover:bg-gray-200"
                data-ticket-id="${ticket.id}"
                data-priority="${ticket.priority.toLowerCase()}"
                data-created-at="${new Date(ticket.created_at).toISOString().slice(0, 19).replace('T', ' ')}">

                <td class="border px-2 py-1 text-center cursor-pointer" onclick="toggleRow(this)">+</td>
                <td class="border px-2 py-1">${ticket.ticket_id}</td>
                <td class="border px-2 py-1 text-left has-tooltip relative cursor-pointer">
                    ${ticket.subject}
                </td>
                <td class="border px-2 py-1" data-priority="${ticket.priority.toLowerCase()}">
                    ${ticket.priority}
                </td>
                <td class="border px-2 py-1" data-status="${ticket.status.toLowerCase()}">
                    ${ticket.status_abbreviation}
                </td>
                <td class="border px-2 py-1 text-center">
                    <span id="created-timer-${ticket.id}"
                          class="created-timer-span priority-${ticket.priority.toLowerCase()}"
                          data-created-at="${ticket.created_at}"
                          data-status="${ticket.status}"
                          data-priority="${ticket.priority.toLowerCase()}"
                          title="Created: ${new Date(ticket.created_at).toLocaleString()}">
                        ${ticket.time_since_created}
                    </span>
                </td>
                <td class="border px-2 py-1 text-center time-column total-time ${ticket.has_exceeded_time_limit ? 'priority-' + ticket.priority.toLowerCase() : ''}">
                    <span id="timer-${ticket.id}"
                          class="timer-span"
                          data-ticket-id="${ticket.id}">
                        ${ticket.time_spent}
                    </span>
                </td>
                <td class="border px-2 py-1 text-center time-column individual-time ${ticket.has_exceeded_time_limit && !ticket.status_changed ? 'exceeded priority-' + ticket.priority.toLowerCase() : ''}">
                    <span id="individual-timer-${ticket.id}"
                          class="timer-span"
                          data-ticket-id="${ticket.id}">
                        ${ticket.individual_time_spent}
                    </span>
                </td>
                <td class="border px-2 py-1 text-center">
                    <input type="hidden" name="csrfmiddlewaretoken" value="${document.querySelector('[name=csrfmiddlewaretoken]').value}">
                    <button class="start-button" data-ticket-id="${ticket.id}">
                        ${ticket.is_active ? 'Stop' : 'Start'}
                    </button>
                </td>
                <td class="border px-2 py-1 text-center" style="vertical-align: middle;">
                    <form method="post" action="{% url 'start_end_call' ticket.id %}"
                          class="call-action-form" data-ticket-id="${ticket.id}">
                        <input type="hidden" name="csrfmiddlewaretoken" value="${document.querySelector('[name=csrfmiddlewaretoken]').value}">
                        ${ticket.call_in_progress ?
                            `<input type="hidden" name="action" value="end_call">
                             <button type="submit">End Call</button>` :
                            `<input type="hidden" name="action" value="start_call">
                             <button type="submit">Start Call</button>`
                        }
                    </form>
                </td>
                <td class="border px-2 py-1 text-center">
                    ${ticket.is_acknowledged ?
                        '<span class="text-success">✅</span>' :
                        `<button class="btn btn-primary btn-sm acknowledge-button"
                                 data-ticket-id="${ticket.id}"
                                 data-acknowledge-button="true"
                                 onclick="notificationManager.acknowledgeTicket(${ticket.id}); return false;">
                            Accept
                         </button>`
                    }
                </td>
            </tr>
            <tr class="hidden text-left bg-gray-100" id="expanded-row-${ticket.id}">
                <td colspan="11" class="py-2 px-4">
                    <a href="{% url 'assign_ticket' ticket.id %}"
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-1 focus:ring-blue-300 font-medium text-sm px-5 py-2.5 me-2 mb-2">
                        Assign
                    </a>

                    <div class="dropdown inline-block">
                        <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-1 focus:ring-blue-300 font-medium text-sm px-5 py-2.5 me-2 mb-2 dropdown-toggle"
                                type="button"
                                id="statusDropdown-${ticket.id}"
                                data-ticket-id="${ticket.id}"
                                aria-expanded="false">
                            Change Status
                        </button>
                        <ul class="dropdown-menu hidden absolute z-10 bg-white border rounded shadow-lg"
                            aria-labelledby="statusDropdown-${ticket.id}">
                            ${ticket.ticket_statuses?.map(status => `
                                <li>
                                    <a class="dropdown-item block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 cursor-pointer change-status"
                                       data-ticket-id="${ticket.id}"
                                       data-new-status="${status.value}">
                                        ${status.label}
                                    </a>
                                </li>
                            `).join('') || ''}
                        </ul>
                    </div>

                    <a href="{% url 'view_call_details' ticket.id %}"
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-1 focus:ring-blue-300 font-medium text-sm px-5 py-2.5 me-2 mb-2">
                        Call Details
                    </a>

                    <a href="{% url 'view_ticket_notes' ticket.id %}"
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-1 focus:ring-blue-300 font-medium text-sm px-5 py-2.5 me-2 mb-2">
                        From existing query
                    </a>

                    <a href="{% url 'view_ticket_notes_all' ticket.id %}"
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-1 focus:ring-blue-300 font-medium text-sm px-5 py-2.5 me-2 mb-2">
                        all notes
                    </a>
                </td>
            </tr>`;
    }

    initializeRowEventListeners(ticketId) {
        // Initialize click handlers and other event listeners for the new row
        const row = this.ticketsTable.querySelector(`tr[data-ticket-id="${ticketId}"]`);
        if (!row) return;

        // Add your existing event listeners here
        const startButton = row.querySelector('.start-button');
        if (startButton) {
            startButton.addEventListener('click', function() {
                // Your existing start button click handler
            });
        }

        // Add other event listeners as needed
    }
}