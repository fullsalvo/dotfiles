#!/bin/bash

output=$(nmcli networking connectivity)

echo ${output^}
