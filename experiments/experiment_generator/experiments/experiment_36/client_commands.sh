#!/bin/sh

# Request scaling 
python message_factory.py -t request_scaling_of_service -h 52.151.70.54 -p 5005 -i 12d5b97b-dafe-11ea-b222-04ea56f99520 --seed 3715
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.141.61.172 -p 5003 -i 12d5b96e-dafe-11ea-b222-04ea56f99520 --seed 58313
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 40.127.108.223 -p 5001 -i 12d5b96f-dafe-11ea-b222-04ea56f99520 --seed 66805
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12d5b97a-dafe-11ea-b222-04ea56f99520 --seed 47549
python3 message_factory.py -r external
python message_factory.py -t request_scaling_of_service -h 20.185.45.222 -p 5004 -i 12d5b96d-dafe-11ea-b222-04ea56f99520 --seed 70805
python3 message_factory.py -r external

# Add results 
python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
python3 message_factory.py -h 52.151.70.54 -p 5005 -r external

