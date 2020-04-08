from django.urls import path, include
from Clients.api import RegisterAPI, LoginAPI, UserAPI
from knox import views as knox_views


urlpatterns = [
    path('clients/auth', include('knox.urls')),
    path('clients/auth/register', RegisterAPI.as_view()),
    path('clients/auth/login', LoginAPI.as_view()),
    path('clients/auth/client', UserAPI.as_view()),
    path('clients/auth/logout', knox_views.LogoutView.as_view(), name='knox_logout'),
]
