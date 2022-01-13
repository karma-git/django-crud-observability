#!/bin/bash

python3 manage.py migrate

python3 manage.py shell -c \
"from django.contrib.auth.models import User; import os; \
    User.objects.create_superuser('admin', os.environ.get('DJANGO_ADMIN_PW', 1234))"

python3 manage.py loaddata utils/positions.json
