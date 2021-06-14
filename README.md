# bootmail
systemd service to send mail on system boot and shutdown

* Place bootmail.service in /etc/systemd/system.
* Place bootmail.sh in /usr/local/sbin.
* Enable the systemd service.

Test by issuing "systemctl start bootmail" and "systemctl stop bootmail".

If you use another SMTP agent, replace sendmail.service in the unit file's _After_ clause with the name of your SMTP agent (eg. postfix.service).

Note that the first shutdown won't send an email because the service hasn't yet been started. 

Based on https://askubuntu.com/questions/851946/send-me-an-email-on-computer-shutdown
