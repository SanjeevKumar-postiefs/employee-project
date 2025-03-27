from django.core.exceptions import PermissionDenied
from functools import wraps
from django.contrib.auth.decorators import login_required

def admin_required(function):
    @wraps(function)
    @login_required
    def wrap(request, *args, **kwargs):
        if hasattr(request.user, 'employeeprofile') and request.user.employeeprofile.is_admin:
            return function(request, *args, **kwargs)
        raise PermissionDenied
    return wrap