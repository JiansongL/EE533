#!/usr/bin/env python3
"""
Socket Client - Lab 1
A simple TCP socket client that sends messages to a server
"""

import socket
import sys

def send_message(message, host='127.0.0.1', port=65432):
    """
    Connect to a TCP socket server and send a message.
    
    Args:
        message: The message to send to the server
        host: IP address of the server (default: localhost)
        port: Port number of the server (default: 65432)
    """
    # Create a TCP socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        try:
            # Connect to the server
            print(f"Connecting to server at {host}:{port}")
            client_socket.connect((host, port))
            print("Connected to server")
            
            # Send message to server
            print(f"Sending message: {message}")
            client_socket.sendall(message.encode('utf-8'))
            
            # Receive response from server
            data = client_socket.recv(1024)
            response = data.decode('utf-8')
            print(f"Received response: {response}")
            
        except ConnectionRefusedError:
            print(f"Error: Could not connect to server at {host}:{port}")
            print("Make sure the server is running")
            sys.exit(1)
        except Exception as e:
            print(f"Error: {e}")
            sys.exit(1)

if __name__ == "__main__":
    # Parse command line arguments
    if len(sys.argv) < 2:
        print("Usage: python3 client.py <message> [host] [port]")
        print("Example: python3 client.py 'Hello, Server!'")
        sys.exit(1)
    
    message = sys.argv[1]
    host = sys.argv[2] if len(sys.argv) > 2 else '127.0.0.1'
    port = int(sys.argv[3]) if len(sys.argv) > 3 else 65432
    
    send_message(message, host, port)
