#!/bin/sh
# Admin/admin logs in and the session cookie is not HttpOnly.
set -e
H=http://web:5000
H1=$(curl -fsS -D - -o /dev/null -d "username=admin&password=admin" "$H/login")
echo "$H1" | grep -qi "^set-cookie: session="
! echo "$H1" | grep -i "^set-cookie: session=" | grep -qi httponly
