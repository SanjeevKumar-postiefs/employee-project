from django.urls import path
from . import views

app_name = 'text_improver'

urlpatterns = [
    path('', views.text_generator_view, name='generator'),
    path('generate/', views.generate_text, name='generate_text'),
]