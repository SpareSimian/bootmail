#! /bin/sh

# https://askubuntu.com/questions/851946/send-me-an-email-on-computer-shutdown

# exit with failure if any commands fail
set -e

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

# flush the queue to push mail to remote servers
/usr/sbin/sendmail -q

# for shutdown, give some time for remote connection to complete
if [ "$1" != startup ]
then
    sleep 5
fi
