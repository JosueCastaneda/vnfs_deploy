#!/bin/sh

# Launch orchestrator
python3 orchestrator_script.py -i 2 -e 4 -h '0.0.0.0' -p 5003 -r 276529 -a $3 -x $1 -y $2 -w $4 -u $5 &
sleep 2

# Add orchestrator's information to my orchestrator
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5003 -n none -m none --vnf_host 13.91.23.61 --vnf_port 5001 -x fb15ee64-ada6-11eb-87c2-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5003 -n none -m none --vnf_host 40.81.204.178 --vnf_port 5002 -x fb15f81e-ada6-11eb-87c2-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5003 -n none -m none --vnf_host 20.68.168.123 --vnf_port 5004 -x fb15faa8-ada6-11eb-87c2-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5003 -n none -m none --vnf_host 52.231.193.62 --vnf_port 5005 -x fb15fbe8-ada6-11eb-87c2-48d705d95785

