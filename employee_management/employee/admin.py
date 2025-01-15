# admin.py

from django.contrib import admin
from .models import Ticket, Note, Call, CallNote

# Register your models here
admin.site.register(Ticket)
admin.site.register(Note)
admin.site.register(Call)
admin.site.register(CallNote)
