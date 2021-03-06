#!/bin/bash

# Launch orchestrator
python orchestrator_script_normal.py -i 1 -e 0 -h '127.0.0.1' -p 5002 &

# Add orchestrator's information to my orchestrator
python message_factory.py -t add_orchestrator -h 127.0.0.1 -p 5002 -n none -m none --vnf_host 127.0.0.1 --vnf_port 5001 -x 000f6094-c031-11ea-b335-04ea56f99520
python message_factory.py -t add_orchestrator -h 127.0.0.1 -p 5002 -n none -m none --vnf_host 127.0.0.1 --vnf_port 5003 -x 000f6096-c031-11ea-b335-04ea56f99520
python message_factory.py -t add_orchestrator -h 127.0.0.1 -p 5002 -n none -m none --vnf_host 127.0.0.1 --vnf_port 5004 -x 000f6097-c031-11ea-b335-04ea56f99520
python message_factory.py -t add_orchestrator -h 127.0.0.1 -p 5002 -n none -m none --vnf_host 127.0.0.1 --vnf_port 5005 -x 000f6098-c031-11ea-b335-04ea56f99520

# Instantiate the orchestrator's VNFs
python vnf_script.py -i 0 -o 1 -e 0 -h '127.0.0.1' -p 3010 &
python vnf_script.py -i 1 -o 1 -e 0 -h '127.0.0.1' -p 3011 &
python vnf_script.py -i 2 -o 1 -e 0 -h '127.0.0.1' -p 3012 &
python vnf_script.py -i 3 -o 1 -e 0 -h '127.0.0.1' -p 3013 &
python vnf_script.py -i 4 -o 1 -e 0 -h '127.0.0.1' -p 3014 &