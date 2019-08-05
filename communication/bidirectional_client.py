import os
import pickle
import socket
import sys
import time

sys.path.append('../')

from entities.communication_entity_package import CommunicationEntityPackage
from entities.parameter_annotation_package import ParameterAnnotationPackage
from entities.parameter_crop_package import ParameterCropPackage
from entities.parameter_file_package import ParameterFilePackage
from entities.parameter_package import ParameterPackage
from entities.parameter_resize_package import ParameterResizePackage


def send_video(file_name: str, server: socket):
    print("Sending video..")
    os.chdir("../videos")
    file_path = os.getcwd() + "/" + file_name
    with open(file_path, "rb") as video:
        buffer = video.read()
        server.sendall(buffer)
    print("Video sent..")

# TODO: Document function with python docstrings
def send_parameters(server_socket: socket, parameters: ParameterPackage):
    print('Sending parameters..')
    initial_message = "begin"
    server_socket.send(initial_message.encode("UTF-8"))
    print("Server response: ", server_socket.recv(1024).decode("UTF-8"))
    data_string = pickle.dumps(parameters)
    server_socket.send(data_string)
    print("Server response: ", server_socket.recv(1024).decode("UTF-8"))


def read_video_package(buffer, client: socket, name_processed_video: str):
    source_file_complete = name_processed_video

    with open(source_file_complete, "wb") as video:
        while buffer:
            video.write(buffer)
            buffer = client.recv(1024)

def acknowledge_message(client: socket, message: str):
    message_encoded = message.encode("UTF-8")
    client.send(message_encoded)

def serve_clients(server_connection: socket, name_processed_video: str):
    print("Listening for connections...")
    client_socket, address = server_connection.accept()
    print("Connection from: " + str(address))
    print('The name sent by server is:', client_socket.recv(1024).decode("UTF-8"))
    acknowledge_message(client_socket, "Ok")
    try:
        print("Starting to read bytes..")
        buffer = client_socket.recv(1024)
        read_video_package(buffer, client_socket, name_processed_video)
        client_socket.close()

    except KeyboardInterrupt:
        if client_socket:
            client_socket.close()
    client_socket.close()


def connect_to_server(host_server: str, port_server:str):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host_server, port_server))
    return s


def set_up_server(client: CommunicationEntityPackage) -> socket:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((client.host, client.port))
    s.listen(client.max_clients)
    return s

def get_current_time():
    return time.time()

def init_parameters():
    host_server = '127.0.0.1'
    port_server = 65432
    host_client = '127.0.0.1'
    port_client = port_server + 1
    filename = "small"
    format_file = ".mp4"
    operation = "speed_up"
    filename_processed = "small_processed_" + operation
    max_clients = 1
    speed_factor = 2
    text = "Test"
    width = 200
    height = 200
    second = "grb_2"

    # Packages
    file_pack = ParameterFilePackage(filename, format_file, filename_processed)
    parameter_crop = ParameterCropPackage(2, 4)
    server = CommunicationEntityPackage(host_server, port_server)
    new_client = CommunicationEntityPackage(host_client, port_client, max_clients)
    annotation_pack = ParameterAnnotationPackage(text)
    resize_pack = ParameterResizePackage(width, height)

    parameters = ParameterPackage(file_pack, operation, speed_factor=speed_factor, second=second,
                                  vnf_servers=server, crop=parameter_crop,
                                  annotation=annotation_pack, resize=resize_pack)
    return parameters

# TODO: Update this class to containe up to date definitions
if __name__ == '__main__':
    param = init_parameters()
    client_connection_server = connect_to_server(param.vnf_servers.host, param.vnf_servers.port)
    send_parameters(client_connection_server, param)
    send_video(param.file_pack.full_name_original(), client_connection_server)
    client_connection_server.close()
    client_connection_server = set_up_server(param.new_client)
    serve_clients(client_connection_server, param.file_pack.full_name_processed())
