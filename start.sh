#!/bin/sh

set -e

add_credentials() {
	htpasswd -b -c /etc/squid/passwords $SCANNER_USERNAME $SCANNER_PASSWORD
}

initialize_cache() {
	echo "Creating cache folder..."

	mkdir /var/spool/squid
	chown -R squid:squid /var/spool/squid

	squid -z

	sleep 10
}

run() {
	echo "Starting squid..."
	add_credentials
	initialize_cache
	squid --foreground -f /etc/squid/squid.conf
}

run
