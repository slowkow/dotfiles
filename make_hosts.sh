#!/usr/bin/env bash
# make_hosts.sh
#
# Blocklists taken from https://github.com/jmdugan/blocklists
#
# Instructions
#
# ./make_hosts.sh
# cat hosts | sudo tee /etc/hosts >/dev/null
# sudo killall -HUP mDNSResponder
#
# For more instructions on flushing your DNS cache, see:
# https://apple.stackexchange.com/questions/303110

curl -s 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0' | pup 'pre text{}' > blocklists/hosts.yoyo.txt

curl -s 'http://winhelp2002.mvps.org/hosts.txt' | grep -v -e ' localhost' > blocklists/hosts.mvps.txt

#curl -s 'http://someonewhocares.org/hosts/zero/hosts' | grep -v -e '\tlocal' | grep -v -e '255.255.255.255' > blocklists/hosts.swc.txt

curl -s 'http://www.malwaredomainlist.com/hostslist/hosts.txt' | grep -v -e 'localhost' > blocklists/hosts.malware.txt

# Redirect to 0.0.0.0 instead of localhost.
perl -pi -e 's/127.0.0.1/0.0.0.0/g' blocklists/hosts.*.txt

echo -e '
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost

' > hosts

# Remove comments and anything that is not 0.0.0.0
cat blocklists/hosts.*.txt | sort -u | grep -e '^0.0.0.0' | grep -v localhost >> hosts 
