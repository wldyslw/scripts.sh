#!/bin/bash

set -eo pipefail

URL=$1

if [ ! -n "$URL"  ]; then
    echo -en "Specify the url to connect: "
    while [ ! -n "$URL"  ]
    do
        read URL
    done
fi

curl --include \
     --no-buffer \
     --header "Connection: Upgrade" \
     --header "Upgrade: websocket" \
     --header "Host: example.com:80" \
     --header "Origin: https://example.com:80" \
     --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" \
     --header "Sec-WebSocket-Version: 13" \
     $URL
