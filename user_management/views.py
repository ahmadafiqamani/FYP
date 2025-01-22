from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm
from .models import CustomUser

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('dashboard')
        else:
            return render(request, 'user_management/login.html', {'error': 'Invalid credentials'})
    return render(request, 'user_management/login.html')

def logout_view(request):
    logout(request)
    return redirect('login')

@login_required
def dashboard(request):
    if request.user.is_admin():
        return render(request, 'user_management/dashboard_admin.html')
    elif request.user.is_basic():
        return render(request, 'user_management/dashboard_basic.html')
    else:
        return redirect('login')

@login_required
def profile(request):
    return render(request, 'user_management/profile.html', {'user': request.user})

@login_required
def register_user(request):
    if not request.user.is_superuser:
        return HttpResponseForbidden("You are not authorized to access this page.")
    
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.role = 'basic'  # Default role for new users
            user.save()
            return redirect('dashboard')  # Redirect after successful registration
    else:
        form = CustomUserCreationForm()
    
    return render(request, 'user_management/register.html', {'form': form})
