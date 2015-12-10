#!/bin/bash

wan=$(curl -s http://ipecho.net/plain)
number=$1

curl http://textbelt.com/text -d number=${number} -d "message=WAN IP: ${wan}"
