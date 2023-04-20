# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '<some really long key 9zyavg&ve6pq(a#w1ugpwyiegxkr1lujz1q7!db+r7@m+jz4y8>'

# Set to DEV for development
SERVER_MODE = 'PROD'

# SECURITY WARNING: don't run with debug turned on in production! (set to True for Dev)
DEBUG = False

# Database (configured for dev)
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases
DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'postgres',
        'PORT': 5432,
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
    }
}
