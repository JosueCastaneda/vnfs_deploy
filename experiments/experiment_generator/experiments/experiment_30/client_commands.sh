#!/bin/sh

# Request scaling 
python message_factory.py -t request_scaling_of_service -h 52.151.70.54 -p 5005 -i 12d5b797-dafe-11ea-b222-04ea56f99520 --seed 19729
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 40.127.108.223 -p 5001 -i 12d5b783-dafe-11ea-b222-04ea56f99520 --seed 4710
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.141.61.172 -p 5003 -i 12d5b789-dafe-11ea-b222-04ea56f99520 --seed 80915
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12d5b79d-dafe-11ea-b222-04ea56f99520 --seed 92319
python3 message_factory.py -r external

# Add results 
python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
python3 message_factory.py -h 52.151.70.54 -p 5005 -r external

