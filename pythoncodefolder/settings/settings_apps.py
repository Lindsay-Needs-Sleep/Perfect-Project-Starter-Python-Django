import os
# from unipath import Path

# os.sys.path.insert(0, Path().child('apps'))
os.sys.path.insert(0, os.path.join(os.getcwd(), 'apps'))

PROJECT_APPS = (
    'myapp',
)

DJANGO_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
)

THIRD_PARTY_APPS = (
)

INSTALLED_APPS = PROJECT_APPS + DJANGO_APPS + THIRD_PARTY_APPS
