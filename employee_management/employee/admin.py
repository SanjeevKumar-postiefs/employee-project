# admin.py

from django.contrib import admin
from .models import Ticket, Call, CallNote, ClientCallNote, DailyActivity

# Register your models here
admin.site.register(Ticket)
admin.site.register(ClientCallNote)
admin.site.register(Call)
admin.site.register(CallNote)
admin.site.register(DailyActivity)
