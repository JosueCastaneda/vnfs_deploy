#!/bin/sh

# Launch orchestrator
python3 orchestrator_script.py -i 0 -e 1 -h '127.0.0.1' -p 4437 -r 276529 -a $3 -x $1 -y $2 -w $4 -u $5 &
sleep 2

# Add orchestrator's information to my orchestrator
python3 message_factory.py -t add_orchestrator -h 127.0.0.1 -p 4437 -n none -m none --vnf_host 127.0.0.1 --vnf_port 4439 -x 7b1c6fe9-a99c-11eb-8771-04ea56f99520
python3 message_factory.py -t add_orchestrator -h 127.0.0.1 -p 4437 -n none -m none --vnf_host 127.0.0.1 --vnf_port 4441 -x 7b1c6fea-a99c-11eb-8771-04ea56f99520
python3 message_factory.py -t add_orchestrator -h 127.0.0.1 -p 4437 -n none -m none --vnf_host 127.0.0.1 --vnf_port 4443 -x 7b1c6feb-a99c-11eb-8771-04ea56f99520
python3 message_factory.py -t add_orchestrator -h 127.0.0.1 -p 4437 -n none -m none --vnf_host 127.0.0.1 --vnf_port 4445 -x 7b1c6fec-a99c-11eb-8771-04ea56f99520

# Instantiate the orchestrator's VNFs 
sleep 2
python3 vnf_script.py -i 0 -o 0 -e 1 -h '127.0.0.1' -p 3001 -u $5 &
python3 vnf_script.py -i 1 -o 0 -e 1 -h '127.0.0.1' -p 3002 -u $5 &
python3 vnf_script.py -i 2 -o 0 -e 1 -h '127.0.0.1' -p 3003 -u $5 &
python3 vnf_script.py -i 3 -o 0 -e 1 -h '127.0.0.1' -p 3004 -u $5 &
python3 vnf_script.py -i 4 -o 0 -e 1 -h '127.0.0.1' -p 3005 -u $5 &
python3 vnf_script.py -i 5 -o 0 -e 1 -h '127.0.0.1' -p 3006 -u $5 &
python3 vnf_script.py -i 6 -o 0 -e 1 -h '127.0.0.1' -p 3007 -u $5 &
python3 vnf_script.py -i 7 -o 0 -e 1 -h '127.0.0.1' -p 3008 -u $5 &
python3 vnf_script.py -i 8 -o 0 -e 1 -h '127.0.0.1' -p 3009 -u $5 &
python3 vnf_script.py -i 9 -o 0 -e 1 -h '127.0.0.1' -p 3010 -u $5 &

