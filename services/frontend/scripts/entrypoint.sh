#!/bin/sh
set -e

cp -R /frontend/nginx/* /etc/nginx/conf.d/

cd /taiga_frontend

# Try to create the directories and ignore the error
# code
mkdir logs || true

if [ ! -f /taiga_frontend/dist/conf.json ]; then
    echo "Generating /taiga_frontend/dist/conf.json file..."
    TAIGA_API_URL=${TAIGA_API_URL:-\"/api/v1/\"}
    DEFAULT_LANGUAGE=${DEFAULT_LANGUAGE:-\"en\"}
    TAIGA_EVENTS_URL=${TAIGA_EVENTS_URL:-null}
    cat > /taiga_frontend/dist/conf.json <<EOF
{
    "api": $TAIGA_API_URL,
    "eventsUrl": $TAIGA_EVENTS_URL,
    "eventsMaxMissedHeartbeats": 5,
    "eventsHeartbeatIntervalTime": 60000,
    "debug": ${TAIGA_DEBUG:-false},
    "debugInfo": ${TAIGA_DEBUG:-false},
    "defaultLanguage": $DEFAULT_LANGUAGE,
    "themes": ["taiga"],
    "defaultTheme": "taiga",
    "publicRegisterEnabled": ${TAIGA_PUBLIC_REGISTER_ENABLED:-true},
    "feedbackEnabled": true,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "contribPlugins": []
}
EOF
fi

# Fix the permissions
chown -R nginx /taiga_frontend/dist
chown -R nginx /frontend

exec "$@"
