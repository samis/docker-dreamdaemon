#!/bin/bash

# DreamDaemon is a small shell script
# It works around issues with the order of arguments given to BYOND's DreamDaemon.
# All it does is one thing: grab the world and port, switch them and pass the other arguments along unchanged.
port=$1; shift; world=$1; shift; options=$@
daemoncommand="$world $port $options"
echo "Executing this DreamDaemon command: DreamDaemon $daemoncommand"
exec DreamDaemon $daemoncommand
