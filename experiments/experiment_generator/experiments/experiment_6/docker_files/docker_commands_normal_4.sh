#!/bin/sh

# Launch orchestrator
python orchestrator_script_normal.py -i 4 -e 6 -h '0.0.0.0' -p 5005 -r 64565 &

# Add orchestrator's information to my orchestrator
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5005 -n none -m none --vnf_host 40.127.108.223 --vnf_port 5001 -x 10fa5aa8-1b7b-11eb-9945-525400e0bd2a
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5005 -n none -m none --vnf_host 52.229.37.237 --vnf_port 5002 -x 10fa5aa9-1b7b-11eb-9945-525400e0bd2a
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5005 -n none -m none --vnf_host 52.141.61.172 --vnf_port 5003 -x 10fa5aaa-1b7b-11eb-9945-525400e0bd2a
python message_factory.py -t add_orchestrator -h 0.0.0.0 -p 5005 -n none -m none --vnf_host 20.185.45.222 --vnf_port 5004 -x 10fa5aab-1b7b-11eb-9945-525400e0bd2a

# Instantiate the orchestrator's VNFs 
python vnf_script.py -i 0 -o 4 -e 6 -h '0.0.0.0' -p 3001 &
python vnf_script.py -i 1 -o 4 -e 6 -h '0.0.0.0' -p 3002 &
python vnf_script.py -i 2 -o 4 -e 6 -h '0.0.0.0' -p 3003 &
python vnf_script.py -i 3 -o 4 -e 6 -h '0.0.0.0' -p 3004 &
python vnf_script.py -i 4 -o 4 -e 6 -h '0.0.0.0' -p 3005 &
python vnf_script.py -i 5 -o 4 -e 6 -h '0.0.0.0' -p 3006 &
python vnf_script.py -i 6 -o 4 -e 6 -h '0.0.0.0' -p 3007 &
python vnf_script.py -i 7 -o 4 -e 6 -h '0.0.0.0' -p 3008 &
python vnf_script.py -i 8 -o 4 -e 6 -h '0.0.0.0' -p 3009 &
python vnf_script.py -i 9 -o 4 -e 6 -h '0.0.0.0' -p 3010 &

#!/bin/sh

# Request scaling 
python message_factory.py -t request_scaling_of_service -h 20.185.45.222 -p 5004 -i 112226be-1b7b-11eb-9945-525400e0bd2a --seed 55956
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 40.127.108.223 -p 5001 -i 1122275e-1b7b-11eb-9945-525400e0bd2a --seed 13201
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.151.70.54 -p 5005 -i 112226a2-1b7b-11eb-9945-525400e0bd2a --seed 69065
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 11222704-1b7b-11eb-9945-525400e0bd2a --seed 20535
python3 message_factory.py -r external

# Add results 
python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
python3 message_factory.py -h 52.151.70.54 -p 5005 -r external

