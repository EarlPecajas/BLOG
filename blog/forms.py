from django import forms

from .models import Post


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['title', 'content']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'input', 'placeholder': 'Title'}),
            'content': forms.Textarea(attrs={'class': 'textarea', 'placeholder': 'Write your post...'}),
        }
