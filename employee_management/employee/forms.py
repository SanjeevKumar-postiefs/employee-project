from datetime import datetime,time
from django import forms
from django.contrib.auth.models import User
from .models import Ticket,EmployeeProfile,OnDutyRequest
from django.contrib.sessions.models import Session
from django.utils import timezone


LEVEL_CHOICES = (
    ('1', 'Level 1'),
)


SKILL_CHOICES = (
    ('Linux', 'Linux'),
    ('Windows', 'Windows/Azure'),
    ('AWS', 'Network/AWS'),
    ('LEVELONE', 'Level One'),
    ('OCI', 'OCI'),
)


class EmployeeProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(max_length=30, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(
        required=True,
        widget=forms.EmailInput(attrs={'class': 'form-control'}),
        help_text='This email will be used for login.'
    )
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}), required=True)
    level = forms.ChoiceField(choices=LEVEL_CHOICES, required=True,
                            widget=forms.Select(attrs={'class': 'form-control'}))
    skill = forms.ChoiceField(choices=SKILL_CHOICES, required=True,
                            widget=forms.Select(attrs={'class': 'form-control'}))
    is_admin = forms.BooleanField(required=False, label="Make this user an admin", widget=forms.CheckboxInput())
    reporting_manager = forms.ModelChoiceField(
        queryset=EmployeeProfile.objects.none(),
        required=True,
        empty_label="Select Reporting Manager"
    )

    class Meta:
        model = EmployeeProfile
        fields = ['first_name', 'last_name', 'email', 'password', 'level', 'skill', 'is_admin', 'reporting_manager']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Update reporting_manager queryset when skill is selected
        if 'skill' in self.data:
            skill = self.data.get('skill')
            self.fields['reporting_manager'].queryset = EmployeeProfile.objects.filter(skill=skill)

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("This email is already registered.")
        return email

    def clean(self):
        cleaned_data = super().clean()
        is_admin = cleaned_data.get('is_admin')
        level = cleaned_data.get('level')
        skill = cleaned_data.get('skill')


        if not is_admin:
            if not level:
                self.add_error('level', 'This field is required.')
            if not skill:
                self.add_error('skill', 'This field is required.')

        return cleaned_data


class UserEditForm(forms.ModelForm):
    skill = forms.ChoiceField(
        choices=SKILL_CHOICES,
        required=True,
        widget=forms.Select(attrs={
            'class': 'form-select',
            'data-bs-toggle': 'select2',
        })
    )

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')
        widgets = {
            'first_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter first name'
            }),
            'last_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter last name'
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter email address'
            })
        }


class TicketForm(forms.ModelForm):
    assigned_to = forms.ModelChoiceField(queryset=User.objects.none(), required=False, label="Assign to")

    class Meta:
        model = Ticket
        fields = ['ticket_id', 'subject', 'status', 'group', 'environment', 'assigned_to', 'note', 'priority']
        widgets = {
            'subject': forms.Textarea(attrs={
                'rows': 1,
                'class': 'form-control',
                'placeholder': 'Enter ticket subject'
            }),
            'note': forms.Textarea(attrs={
                'rows': 4,
                'class': 'form-control',
                'placeholder': 'Enter ticket notes'
            }),
            'priority': forms.Select(attrs={'class': 'form-select'}),
            'status': forms.Select(attrs={'class': 'form-select'}),
            'group': forms.Select(attrs={'class': 'form-select'}),
            'environment': forms.Select(attrs={'class': 'form-select'}),
            'ticket_id': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter ticket ID'
            }),
        }

    def __init__(self, *args, **kwargs):
        is_assign = kwargs.pop('is_assign', False)  # Add this parameter
        group = kwargs.pop('group', None)
        super().__init__(*args, **kwargs)

        # Make fields optional during assignment
        if is_assign:
            self.fields['ticket_id'].required = False
            self.fields['subject'].required = False
            self.fields['environment'].required = False

        active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
        user_ids = [session.get_decoded().get('_auth_user_id') for session in active_sessions]
        logged_in_users = User.objects.filter(id__in=user_ids, is_active=True, employeeprofile__is_on_break=False)

        if group:
            self.fields['assigned_to'].queryset = logged_in_users.filter(employeeprofile__skill=group)
        else:
            self.fields['assigned_to'].queryset = logged_in_users


class OnDutyRequestForm(forms.ModelForm):
    class Meta:
        model = OnDutyRequest
        fields = ['start_date', 'start_time', 'end_date', 'end_time', 'reason']
        widgets = {
            'start_date': forms.DateInput(
                attrs={
                    'type': 'date',
                    'class': 'mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm'
                }
            ),
            'end_date': forms.DateInput(
                attrs={
                    'type': 'date',
                    'class': 'mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm'
                }
            ),
            'start_time': forms.TimeInput(
                attrs={
                    'type': 'time',
                    'class': 'mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm'
                }
            ),
            'end_time': forms.TimeInput(
                attrs={
                    'type': 'time',
                    'class': 'mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm'
                }
            ),
            'reason': forms.Textarea(
                attrs={
                    'rows': 4,
                    'class': 'mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm'
                }
            ),
        }

    def clean(self):
        cleaned_data = super().clean()
        start_date = cleaned_data.get('start_date')
        end_date = cleaned_data.get('end_date')
        start_time = cleaned_data.get('start_time')
        end_time = cleaned_data.get('end_time')

        if all([start_date, end_date, start_time, end_time]):
            # Create timezone-aware datetime objects
            start_datetime = timezone.make_aware(
                datetime.combine(start_date, start_time)
            )
            end_datetime = timezone.make_aware(
                datetime.combine(end_date, end_time)
            )
            current_datetime = timezone.now()

            if start_datetime > end_datetime:
                raise forms.ValidationError("End date/time cannot be before start date/time")

            if start_datetime < current_datetime:
                raise forms.ValidationError("Start date/time cannot be in the past")

        return cleaned_data
