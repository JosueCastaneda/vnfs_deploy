#!/bin/sh

# Dependencies 1
python3 message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12cb17e6-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
#!/bin/sh

# Dependencies 1
python3 message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12cb17db-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
#!/bin/sh

# Dependencies 2
python3 message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12cb17e2-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
#!/bin/sh

# Dependencies 3
python3 message_factory.py -t request_scaling_of_service -h 40.127.108.223 -p 5001 -i 12cb17df-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
#!/bin/sh

# Dependencies 4
python3 message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12cb17dd-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
#!/bin/sh

# Dependencies 4
python3 message_factory.py -t request_scaling_of_service -h 52.229.37.237 -p 5002 -i 12cb17e3-dafe-11ea-b222-04ea56f99520
python3 message_factory.py -r external
# Add results 
python3 message_factory.py -h 40.127.108.223 -p 5001 -r external
python3 message_factory.py -h 52.229.37.237 -p 5002 -r external
python3 message_factory.py -h 52.141.61.172 -p 5003 -r external
python3 message_factory.py -h 20.185.45.222 -p 5004 -r external
python3 message_factory.py -h 52.151.70.54 -p 5005 -r external
