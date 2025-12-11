from django.http import JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse
from django.views.decorators.http import require_http_methods

from .forms import PostForm
from .models import Post


def post_list(request):
    posts = Post.objects.all()
    return render(request, 'blog/post_list.html', {'posts': posts})


def post_detail(request, slug):
    post = get_object_or_404(Post, slug=slug)
    return render(request, 'blog/post_detail.html', {'post': post})


@require_http_methods(['GET', 'POST'])
def post_create(request):
    form = PostForm(request.POST or None)
    if form.is_valid():
        post = form.save()
        return redirect(post.get_absolute_url())
    return render(request, 'blog/post_form.html', {'form': form, 'mode': 'create'})


@require_http_methods(['GET', 'POST'])
def post_update(request, slug):
    post = get_object_or_404(Post, slug=slug)
    form = PostForm(request.POST or None, instance=post)
    if form.is_valid():
        form.save()
        return redirect(post.get_absolute_url())
    return render(request, 'blog/post_form.html', {'form': form, 'mode': 'edit', 'post': post})


@require_http_methods(['GET', 'POST'])
def post_delete(request, slug):
    post = get_object_or_404(Post, slug=slug)
    if request.method == 'POST':
        post.delete()
        return redirect('post_list')
    return render(request, 'blog/post_confirm_delete.html', {'post': post})


def api_post_list(request):
    posts = Post.objects.all()
    data = [
        {
            'title': post.title,
            'slug': post.slug,
            'content': post.content,
            'created_at': post.created_at,
            'updated_at': post.updated_at,
            'url': request.build_absolute_uri(post.get_absolute_url()),
        }
        for post in posts
    ]
    return JsonResponse({'results': data})


def api_post_detail(request, slug):
    post = get_object_or_404(Post, slug=slug)
    data = {
        'title': post.title,
        'slug': post.slug,
        'content': post.content,
        'created_at': post.created_at,
        'updated_at': post.updated_at,
        'url': request.build_absolute_uri(post.get_absolute_url()),
    }
    return JsonResponse(data)
