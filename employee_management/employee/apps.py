from django.apps import AppConfig


class EmployeeConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'employee'



class YourAppConfig(AppConfig):
    name = 'employee'

    def ready(self):
        import employee.signals

