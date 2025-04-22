#!/bin/bash

apt update && apt intall -y freeradius

cat << EOF > /etc/pam.d/radiusd
account required                        pam_permit.so
auth	[success=1 default=ignore]      pam_exec.so     expose_authtok  log=/var/log/freeradius/pam.log	/opt/bin/pam-exec-oauth2
auth    requisite                       pam_deny.so
auth    required                        pam_permit.so
EOF

ls -s  /workspaces/pam-exec-oauth2/pam-exec-oauth2