#!/bin/sh

# Request scaling 
python message_factory.py -t request_scaling_of_service -h 20.185.45.222 -p 5004 -i 112e1703-1b7b-11eb-9945-525400e0bd2a --seed 61311
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.151.70.54 -p 5005 -i 112e16e9-1b7b-11eb-9945-525400e0bd2a --seed 69065
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 1122298b-1b7b-11eb-9945-525400e0bd2a --seed 20535
python3 message_factory.py -r external

# Add results 
python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
python3 message_factory.py -h 52.151.70.54 -p 5005 -r external

