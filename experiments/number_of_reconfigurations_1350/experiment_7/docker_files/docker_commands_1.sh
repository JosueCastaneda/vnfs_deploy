#!/bin/sh

# Launch orchestrator
python3 orchestrator_script.py -i 1 -e 7 -h '0.0.0.0' -p 5002 -r 276529 -a $3 -x $1 -y $2 -w $4 -u $5 &
sleep 2

# Add orchestrator's information to my orchestrator
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5002 -n none -m none --vnf_host 13.91.23.61 --vnf_port 5001 -x 1ef49ace-ada7-11eb-b777-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5002 -n none -m none --vnf_host 20.84.67.101 --vnf_port 5003 -x 1ef49ee8-ada7-11eb-b777-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5002 -n none -m none --vnf_host 20.68.168.123 --vnf_port 5004 -x 1ef49f88-ada7-11eb-b777-48d705d95785
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5002 -n none -m none --vnf_host 52.231.193.62 --vnf_port 5005 -x 1ef4a050-ada7-11eb-b777-48d705d95785

