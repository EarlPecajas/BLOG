from django.urls import path

from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('posts/create/', views.post_create, name='post_create'),
    path('posts/<slug:slug>/', views.post_detail, name='post_detail'),
    path('posts/<slug:slug>/edit/', views.post_update, name='post_update'),
    path('posts/<slug:slug>/delete/', views.post_delete, name='post_delete'),
    path('api/posts/', views.api_post_list, name='api_post_list'),
    path('api/posts/<slug:slug>/', views.api_post_detail, name='api_post_detail'),
]
