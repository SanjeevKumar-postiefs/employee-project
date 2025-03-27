from django import forms


class TextImproverForm(forms.Form):
    IMPROVEMENT_MODES = [
        ('general', 'General Improvement'),
        ('formal', 'Formal Writing'),
        ('email', 'Email Format'),
        ('technical', 'Technical Writing'),
    ]

    input_text = forms.CharField(
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': '10',
            'placeholder': 'Enter your text here...'
        }),
        required=True
    )

    improvement_mode = forms.ChoiceField(
        choices=IMPROVEMENT_MODES,
        initial='general',
        widget=forms.Select(attrs={'class': 'form-control'})
    )