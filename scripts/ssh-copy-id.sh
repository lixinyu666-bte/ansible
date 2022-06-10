#!/bin/sh

# rm -f ./authorized_keys; touch ./authorized_keys


cat node.hosts | while read ip passwd; do
    echo $ip $passwd
    sshpass -p $passwd ssh-copy-id -f $ip 2>/dev/null
done
