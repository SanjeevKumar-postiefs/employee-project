from django.shortcuts import redirect
from django.http import HttpResponseForbidden
from .models import EmployeeProfile


def admin_required(view_func):
    def wrap(request, *args, **kwargs):
        if request.user.is_authenticated:
            # Check if the user is a superuser
            if request.user.is_superuser:
                return view_func(request, *args, **kwargs)

            try:
                # Get the EmployeeProfile associated with the logged-in user
                employee_profile = EmployeeProfile.objects.get(user=request.user)
                # Check if the user is an admin according to the EmployeeProfile
                if employee_profile.is_admin:
                    return view_func(request, *args, **kwargs)
                else:
                    return HttpResponseForbidden("You are not authorized to view this page.")
            except EmployeeProfile.DoesNotExist:
                return redirect('login')
        else:
            return redirect('login')

    return wrap