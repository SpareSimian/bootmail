#! /bin/sh

# https://askubuntu.com/questions/851946/send-me-an-email-on-computer-shutdown

EMAIL="root"

if [ "$1" = startup ]
then
    ACTION="started successfully"
    BODY="$ACTION"
else
    ACTION="is shutting down"
    BODY=`uptime`
fi

SUBJECT="[$HOSTNAME] - System $1"

echo "$BODY" | mail -S sendwait -s "${SUBJECT}" "${EMAIL}"
