#!/bin/sh
set -e

# Lets go to the application directory
cd /taiga_backend

# Lets compile the messages
python manage.py compilemessages

# Lets copy the local settings
cp /backend_scripts/local.py settings/local.py
cp /backend_scripts/celery_local.py settings/celery_local.py

# Run the migrations every time, so we can
# be sure that whatever changes is loaded
python /taiga_backend/manage.py migrate --noinput

# Setup database automatically if needed
if [ ! -f /taiga_backend/database_initialized ]; then
    echo "Configuring initial database"
    python /taiga_backend/manage.py loaddata initial_user
    python /taiga_backend/manage.py loaddata initial_project_templates
    touch /taiga_backend/database_initialized
fi

# Lets generate the static files
python /taiga_backend/manage.py collectstatic --noinput

# Fixing the permissions
chown -R taiga /backend_scripts
chown -R taiga /taiga_backend

exec "$@"
