from django import forms
from django.contrib.auth.models import User
from .models import Ticket,EmployeeProfile
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
    username = forms.CharField(max_length=150, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    first_name = forms.CharField(max_length=30, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(max_length=30, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(required=True, widget=forms.EmailInput(attrs={'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}), required=True)

    # Updated: Only Level 1
    level = forms.ChoiceField(choices=LEVEL_CHOICES, required=True,
                              widget=forms.Select(attrs={'class': 'form-control'}))

    # Keep relevant skills
    skill = forms.ChoiceField(choices=SKILL_CHOICES, required=True,
                              widget=forms.Select(attrs={'class': 'form-control'}))

    is_admin = forms.BooleanField(required=False, label="Make this user an admin", widget=forms.CheckboxInput())

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password']

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
    skill = forms.ChoiceField(choices=SKILL_CHOICES, required=True, widget=forms.Select(attrs={'class': 'form-control'}))
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')


class TicketForm(forms.ModelForm):
    assigned_to = forms.ModelChoiceField(queryset=User.objects.none(), required=False, label="Assign to")

    class Meta:
        model = Ticket
        fields = ['ticket_id', 'subject', 'status', 'group', 'assigned_to', 'note', 'priority']
        widgets = {
            'subject': forms.Textarea(attrs={'rows': 4, 'maxlength': 300}),
            'note': forms.Textarea(attrs={'rows': 4}),
            'priority': forms.Select(attrs={'class': 'form-select'}),
        }

    def __init__(self, *args, **kwargs):
        group = kwargs.pop('group', None)
        super().__init__(*args, **kwargs)
        active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
        user_ids = [session.get_decoded().get('_auth_user_id') for session in active_sessions]
        logged_in_users = User.objects.filter(id__in=user_ids, is_active=True, employeeprofile__is_on_break=False)

        if group:
            self.fields['assigned_to'].queryset = logged_in_users.filter(employeeprofile__skill=group)
        else:
            self.fields['assigned_to'].queryset = logged_in_users
