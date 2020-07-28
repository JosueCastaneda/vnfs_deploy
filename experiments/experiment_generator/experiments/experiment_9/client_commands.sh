#!/bin/sh

# Request scaling 
python message_factory.py -t request_scaling_of_service -h 52.141.61.172 -p 5003 -i 23d13800-ce65-11ea-9f26-04ea56f99520 --seed 366793
python message_factory.py -t request_scaling_of_service -h 20.185.45.222 -p 5004 -i 23d137fc-ce65-11ea-9f26-04ea56f99520 --seed 83092
python message_factory.py -t request_scaling_of_service -h 40.127.108.223 -p 5001 -i 23d137fe-ce65-11ea-9f26-04ea56f99520 --seed 563828
python message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 23d137f9-ce65-11ea-9f26-04ea56f99520 --seed 583195

# Add results 
#python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
#python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
#python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
#python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
#python3 message_factory.py -h 52.151.70.54 -p 5005 -r external
