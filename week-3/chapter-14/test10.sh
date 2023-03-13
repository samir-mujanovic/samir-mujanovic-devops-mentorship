#!/bin/bash
# Grabbing the latest parameter

params=$#
echo
echo The last parameter is $params
echo The last parameter is ${!#}
echo