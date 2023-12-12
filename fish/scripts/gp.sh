#!/bin/bash

if $SSH_AGENT_PID > /dev/null
then
   echo "ssh-agent is already running"
   git pull
else
	eval $(ssh-agent); ssh-add && git pull	
fi

