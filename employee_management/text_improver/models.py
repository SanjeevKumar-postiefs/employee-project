from django.db import models
from django.contrib.auth.models import User

class ImprovedText(models.Model):
    original_text = models.TextField()
    improved_text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        ordering = ['-created_at']