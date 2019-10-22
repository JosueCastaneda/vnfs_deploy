#Run orchestrators
docker exec -it mn.orch_1 python orchestrator_script.py -h 10.0.0.30 -p 5461 -n orch_1 &
docker exec -it mn.orch_2 python orchestrator_script.py -h 10.0.0.32 -p 5463 -n orch_2 &
docker exec -it mn.orch_3 python orchestrator_script.py -h 10.0.0.34 -p 5465 -n orch_3 &
docker exec -it mn.orch_4 python orchestrator_script.py -h 10.0.0.36 -p 5467 -n orch_4 &

# Run all VNFs from containers
docker exec -it mn.vnf4_fade_in python vnf_script.py -h 10.0.0.14 -v 4437 -o 10.0.0.32 -q 5463 -n fade_in --topology 0.0975,0,0,0 --initial 10 &
docker exec -it mn.vnf10_invert_colors python vnf_script.py -h 10.0.0.21 -v 4451 -o 10.0.0.36 -q 5467 -n invert_colors --topology 0.1015,0,0,0 --initial 31 &
docker exec -it mn.vnf6_mirror_x python vnf_script.py -h 10.0.0.17 -v 4443 -o 10.0.0.34 -q 5465 -n mirror_x --topology 0.0887,0,0,0 --initial 19 &
docker exec -it mn.vnf10_composite_stadium python vnf_script.py -h 10.0.0.100 -v 4453 -o 10.0.0.36 -q 5467 -n composite_stadium --topology 0.1571,0,0,0 --initial 33 &
docker exec -it mn.vnf6_mirror_y python vnf_script.py -h 10.0.0.16 -v 4441 -o 10.0.0.32 -q 5463 -n mirror_y --topology 0.0888,0,0,0 --initial 16 &
docker exec -it mn.vnf2_rotate python vnf_script.py -h 10.0.0.13 -v 4433 -o 10.0.0.30 -q 5461 -n rotate --topology 0.0958,0,0,0 --initial 4 &
docker exec -it mn.vnf7_annotate python vnf_script.py -h 10.0.0.18 -v 4445 -o 10.0.0.34 -q 5465 -n annotate --topology 0.2070,0,0,0 --initial 22 &
docker exec -it mn.vnf8_fade_out python vnf_script.py -h 10.0.0.19 -v 4447 -o 10.0.0.34 -q 5465 -n fade_out --topology 0.0785,0,0,0 --initial 25 &

# Add orchestrators to first orchestrator
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.30 -p 5461 -n none -m none --vnf_host 10.0.0.32 --vnf_port 5463
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.30 -p 5461 -n none -m none --vnf_host 10.0.0.34 --vnf_port 5465
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.30 -p 5461 -n none -m none --vnf_host 10.0.0.36 --vnf_port 5467

# Add orchestrators to second orchestrator
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.32 -p 5463 -n none -m none --vnf_host 10.0.0.30 --vnf_port 5461
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.32 -p 5463 -n none -m none --vnf_host 10.0.0.34 --vnf_port 5465
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.32 -p 5463 -n none -m none --vnf_host 10.0.0.36 --vnf_port 5467

# Add orchestrators to third orchestrator
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.34 -p 5465 -n none -m none --vnf_host 10.0.0.30 --vnf_port 5461
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.34 -p 5465 -n none -m none --vnf_host 10.0.0.32 --vnf_port 5463
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.34 -p 5465 -n none -m none --vnf_host 10.0.0.36 --vnf_port 5467

# Add orchestrators to fourth orchestrator
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.36 -p 5467 -n none -m none --vnf_host 10.0.0.30 --vnf_port 5461
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.36 -p 5467 -n none -m none --vnf_host 10.0.0.32 --vnf_port 5463
docker exec -it mn.source python message_factory.py -t add_orchestrator -h 10.0.0.36 -p 5467 -n none -m none --vnf_host 10.0.0.36 --vnf_port 5467

# Add VNFs to service 1
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.17 -p 4443 -n none -m none -v 10.0.0.21 --vnf_port 4451
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.21 -p 4451 -n none -m none -v 10.0.0.14 --vnf_port 4437

# Add VNFs to service 2
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.100 -p 4453 -n none -m none -v 10.0.0.16 --vnf_port 4441
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.16 -p 4441 -n none -m none -v 10.0.0.13 --vnf_port 4433

# Add VNFs to service 3
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.18 -p 4445 -n none -m none -v 10.0.0.19 --vnf_port 4447
docker exec -it mn.source python message_factory.py -t add_chain -h 10.0.0.19 -p 4447 -n none -m none -v 10.0.0.17 --vnf_port 4443

# Run command to be sure its working
docker exec -it mn.source python message_factory.py -t process -h 10.0.0.13 -p 4433 -n none -m none -v none --vnf_port none