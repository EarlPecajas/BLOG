from django.urls import path

from .views import PostListCreateView, PostRetrieveUpdateDestroyView

urlpatterns = [
    path('posts/', PostListCreateView.as_view(), name='api_post_list'),
    path('posts/<slug:slug>/', PostRetrieveUpdateDestroyView.as_view(), name='api_post_detail'),
]
