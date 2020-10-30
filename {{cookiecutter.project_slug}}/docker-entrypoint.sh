#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Trace execution
[[ "${DEBUG}" ]] && set -x

export DJANGO_SETTINGS_MODULE={{ cookiecutter.project_slug }}.settings."${ENV:-prod}"

python manage.py migrate
python manage.py collectstatic --no-input

if [[ "${ENV}" == "dev" ]]; then
  python manage.py runserver 0.0.0.0:8000
else
  export UWSGI_PROCESSES=${UWSGI_PROCESSES:-5}
  export UWSGI_THREADS=${UWSGI_THREADS:-4}
  uwsgi --ini uwsgi.ini
fi