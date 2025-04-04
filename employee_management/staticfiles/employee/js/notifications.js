class NotificationManager {
    constructor() {
        this.checkInterval = 30000; // Check every 30 seconds
        this.dismissedNotifications = new Set();
        this.notificationSound = new Audio('/static/employee/sounds/notification.mp3');
        this.notificationSound.volume = 0.5;
    }

    init() {
        this.checkNotifications();
        setInterval(() => this.checkNotifications(), this.checkInterval);
    }

    playSound() {
        try {
            this.notificationSound.currentTime = 0;
            this.notificationSound.play().catch(error => {
                console.error("Sound play failed:", error);
            });
        } catch(e) {
            console.error("Sound play error:", e);
        }
    }

    async checkNotifications() {
        try {
            const response = await fetch('/check-unified-notifications/', {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            });
            const data = await response.json();

            if (data.notifications && data.notifications.length > 0) {
                this.handleNotifications(data.notifications);
            }
        } catch (error) {
            console.error('Error checking notifications:', error);
        }
    }

    handleNotifications(notifications) {
        const activeNotifications = notifications.filter(
            n => !this.dismissedNotifications.has(n.ticket_id)
        );

        if (activeNotifications.length === 0) return;

        this.playSound();
        const groupedNotifications = this.groupNotifications(activeNotifications);
        this.showNotifications(groupedNotifications);
    }

    groupNotifications(notifications) {
        return notifications.reduce((acc, notification) => {
            if (!acc[notification.type]) {
                acc[notification.type] = [];
            }
            acc[notification.type].push(notification);
            return acc;
        }, {});
    }

    showNotifications(groupedNotifications) {
        if (groupedNotifications.exceeded) {
            this.showExceededNotifications(groupedNotifications.exceeded);
        }

        if (groupedNotifications.pre_notification) {
            this.showPreNotifications(groupedNotifications.pre_notification);
        }

        if (groupedNotifications.assigned) {
        this.showAssignmentNotifications(groupedNotifications.assigned);
        }

        if (groupedNotifications.pending) {
            this.showPendingNotifications(groupedNotifications.pending);
        }

        if (groupedNotifications.created) {
        this.showAssignmentNotifications(groupedNotifications.created);
        }
    }

    showExceededNotifications(notifications) {
        const notificationsList = notifications.map(notification => {
            const timeElapsed = this.formatTimeElapsed(notification.created_at);
            return `
                <div class="notification-item priority-${notification.priority.toLowerCase()}"
                     id="notification-${notification.ticket_id}">
                    <div class="notification-content">
                        <div class="notification-header">
                            <span class="ticket-id">#${notification.ticket_number}</span>
                            <span class="priority-badge ${notification.priority.toLowerCase()}">
                                ${notification.priority.toUpperCase()}
                            </span>
                        </div>
                        <div class="notification-body">
                            <div class="subject">${notification.subject}</div>
                            <div class="time-exceeded">Exceeded by: ${timeElapsed}</div>
                        </div>
                    </div>
                    <button class="dismiss-ticket" onclick="notificationManager.dismissTicket('${notification.ticket_id}')">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            `;
        }).join('');

        const notificationContent = `
            <div class="notifications-container">
                <div class="notifications-header">
                    <h4>🚨 Exceeded Time Limit Tickets (${notifications.length})</h4>
                    <button class="dismiss-all" onclick="notificationManager.dismissAllTickets()">
                        Dismiss All
                    </button>
                </div>
                <div class="notifications-list">
                    ${notificationsList}
                </div>
            </div>
        `;

        Swal.fire({
            html: notificationContent,
            showConfirmButton: false,
            showCloseButton: true,
            position: 'top-end',
            width: '400px',
            padding: '0',
            customClass: {
                popup: 'notifications-popup'
            }
        });
    }

    showPreNotifications(notifications) {
        notifications.forEach(notification => {
            const priorityColors = {
                urgent: '#ff4444',
                high: '#ffbb33',
                medium: '#ff8800',
                low: '#00C851'
            };

            const notificationContent = `
                <div class="priority-notification ${notification.priority.toLowerCase()}"
                     style="background: linear-gradient(45deg, ${priorityColors[notification.priority.toLowerCase()]}22,
                            ${priorityColors[notification.priority.toLowerCase()]}44);
                            border-left: 4px solid ${priorityColors[notification.priority.toLowerCase()]};
                            padding: 15px;
                            border-radius: 8px;">
                    <h4 style="margin-bottom: 10px; color: ${priorityColors[notification.priority.toLowerCase()]}">
                        ⚠️ SLA Warning!
                    </h4>
                    <div style="text-align: left;">
                        <strong>Ticket:</strong> #${notification.ticket_number}<br>
                        <strong>Subject:</strong> ${notification.subject}<br>
                        <strong>Priority:</strong>
                        <span style="color: ${priorityColors[notification.priority.toLowerCase()]}">
                            ${notification.priority.toUpperCase()}
                        </span><br>
                        <strong>Message:</strong> ${notification.message}
                    </div>
                </div>
            `;

            Swal.fire({
                html: notificationContent,
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true,
                toast: true,
                position: 'top-right',
                showCloseButton: true,
                customClass: {
                    popup: 'animated-notification'
                }
            });
        });
    }

    showAssignmentNotifications(notifications) {
        // Sort notifications by priority
        const sortedNotifications = notifications.sort((a, b) => {
            const priorityOrder = { urgent: 0, high: 1, medium: 2, low: 3 };
            return priorityOrder[a.priority.toLowerCase()] - priorityOrder[b.priority.toLowerCase()];
        });

        const notificationsList = sortedNotifications.map(notification => `
            <div class="notification-item priority-${notification.priority.toLowerCase()}"
                 id="notification-${notification.ticket_id}">
                <div class="notification-content">
                    <div class="notification-header">
                        <span class="ticket-id">#${notification.ticket_number}</span>
                        <span class="priority-badge ${notification.priority.toLowerCase()}">
                            ${notification.priority.toUpperCase()}
                        </span>
                    </div>
                    <div class="notification-body">
                        <div class="subject">${notification.subject}</div>
                        <div class="message">${notification.message}</div>
                    </div>
                </div>
                <div class="notification-actions">
                    <button class="btn btn-primary btn-sm"
                            onclick="notificationManager.acknowledgeTicket(${notification.ticket_id})">
                        Accept
                    </button>
                    <button class="dismiss-ticket"
                            onclick="notificationManager.dismissTicket('${notification.ticket_id}')">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        `).join('');

        const notificationContent = `
            <div class="notifications-container">
                <div class="notifications-header">
                    <h4>${notifications[0].type === 'assigned' ? '🔄 Reassigned Tickets' : '🆕 New Tickets'} (${notifications.length})</h4>
                    <button class="dismiss-all" onclick="notificationManager.dismissAllTickets()">
                        Dismiss All
                    </button>
                </div>
                <div class="notifications-list">
                    ${notificationsList}
                </div>
            </div>
        `;

        Swal.fire({
            html: notificationContent,
            showConfirmButton: false,
            showCloseButton: true,
            position: 'top-end',
            width: '400px',
            padding: '0',
            customClass: {
                popup: 'notifications-popup'
            }
        });
    }

    showPendingNotifications(notifications) {
        notifications.forEach(notification => {
            this.createPendingNotification(
                notification.message,
                notification.ticket_id,
                notification.ticket_number
            );
        });
    }

    createPendingNotification(message, ticketId, ticketNumber) {
        const existingNotification = document.querySelector(
            `.ticket-notification[data-ticket-id="${ticketId}"]`
        );
        if (existingNotification) {
            existingNotification.remove();
        }

        const notificationDiv = document.createElement('div');
        notificationDiv.className = 'alert alert-info alert-dismissible fade show ticket-notification';
        notificationDiv.setAttribute('data-ticket-id', ticketId);
        notificationDiv.setAttribute('role', 'alert');
        notificationDiv.innerHTML = `
            <div class="notification-header">
                <strong>Ticket #${ticketNumber}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                        onclick="notificationManager.dismissPendingNotification(event, ${ticketId})"></button>
            </div>
            <div class="notification-body">
                ${message}
            </div>
            <div class="notification-actions">
                <button type="button" class="btn btn-primary btn-sm"
                        onclick="notificationManager.acknowledgeTicket(${ticketId})">
                    Accept Ticket
                </button>
            </div>
        `;

        document.body.appendChild(notificationDiv);
    }

    formatTimeElapsed(createdAt) {
        const created = new Date(createdAt);
        const now = new Date();
        const diff = Math.floor((now - created) / 1000); // difference in seconds

        const hours = Math.floor(diff / 3600);
        const minutes = Math.floor((diff % 3600) / 60);
        return hours > 0 ? `${hours}h ${minutes}m` : `${minutes}m`;
    }

    dismissTicket(ticketId) {
        this.dismissedNotifications.add(ticketId);
        const element = document.getElementById(`notification-${ticketId}`);
        if (element) {
            element.style.animation = 'slideOut 0.3s forwards';
            setTimeout(() => {
                element.remove();
                const container = document.querySelector('.notifications-list');
                if (container && container.children.length === 0) {
                    Swal.close();
                }
            }, 300);
        }
    }

    dismissAllTickets() {
        const notifications = document.querySelectorAll('.notification-item');
        notifications.forEach(notification => {
            const ticketId = notification.id.replace('notification-', '');
            this.dismissedNotifications.add(ticketId);
        });
        Swal.close();
    }

    dismissPendingNotification(event, ticketId) {
        event.preventDefault();
        const notification = event.target.closest('.ticket-notification');
        if (notification) {
            notification.style.display = 'none';
        }
    }

// In your NotificationManager class, update the acknowledgeTicket method:
async acknowledgeTicket(ticketId) {
    try {
        // Get CSRF token from the meta tag or cookie
        const csrfToken = document.querySelector('[name=csrfmiddlewaretoken]')?.value ||
                         document.cookie.split('; ')
                         .find(row => row.startsWith('csrftoken='))
                         ?.split('=')[1];

        if (!csrfToken) {
            console.error('CSRF token not found');
            throw new Error('CSRF token missing');
        }

        const response = await fetch(`/acknowledge-ticket/${ticketId}/`, {
            method: 'POST',
            headers: {
                'X-CSRFToken': csrfToken,
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
            },
            credentials: 'include'  // Important for cookies
        });

        const data = await response.json();

        if (data.success) {
            // Update only the acknowledge button cell
            if (acknowledgeButton) {
                const tdElement = acknowledgeButton.closest('td');
                if (tdElement) {
                    tdElement.innerHTML = '<span class="text-success">✅</span>';
                }
            }

            // Show success toast
            Swal.fire({
                icon: 'success',
                title: 'Ticket Accepted',
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000
            });

            // Clear any notifications for this ticket
            this.dismissedNotifications.add(ticketId);
            const notifications = document.querySelectorAll(
                `.ticket-notification[data-ticket-id="${ticketId}"]`
            );
            notifications.forEach(notification => notification.remove());
        } else {
            throw new Error('Failed to acknowledge ticket');
        }
    } catch (error) {
        console.error('Error:', error);
        // Revert button state if there was an error
        const acknowledgeButton = document.querySelector(`button.acknowledge-button[data-ticket-id="${ticketId}"][data-acknowledge-button="true"]`);
        if (acknowledgeButton) {
            acknowledgeButton.disabled = false;
            acknowledgeButton.innerHTML = 'Accept';
        }

        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Failed to accept ticket. Please try again.',
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });
    }
}

// Make sure notificationManager is globally available
window.notificationManager = new NotificationManager();

// Initialize notification manager
document.addEventListener('DOMContentLoaded', () => {
    window.notificationManager.init();
});

// Add to your notifications.js
document.addEventListener('DOMContentLoaded', function() {
    const notificationToggle = document.querySelector('.notification-badge');
    const notificationDropdown = document.querySelector('.notification-dropdown');

    if (notificationToggle && notificationDropdown) {
        notificationToggle.addEventListener('click', function(e) {
            e.stopPropagation();
            notificationDropdown.style.display =
                notificationDropdown.style.display === 'block' ? 'none' : 'block';
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!notificationDropdown.contains(e.target)) {
                notificationDropdown.style.display = 'none';
            }
        });
    }
});