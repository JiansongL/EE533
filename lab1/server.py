#!/usr/bin/env python3
"""
Socket Server - Lab 1
A simple TCP socket server that receives messages from clients
"""

import socket
import sys

def start_server(host='127.0.0.1', port=65432):
    """
    Start a TCP socket server that listens for incoming connections
    and receives messages from clients.
    
    Args:
        host: IP address to bind to (default: localhost)
        port: Port number to listen on (default: 65432)
    """
    # Create a TCP socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        # Allow reuse of address
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        # Bind the socket to the address and port
        server_socket.bind((host, port))
        
        # Listen for incoming connections
        server_socket.listen(5)
        print(f"Server listening on {host}:{port}")
        
        try:
            while True:
                # Accept incoming connection
                client_socket, client_address = server_socket.accept()
                print(f"\nConnection from {client_address}")
                
                with client_socket:
                    # Receive message from client
                    data = client_socket.recv(1024)
                    
                    if data:
                        message = data.decode('utf-8')
                        print(f"Received message: {message}")
                        
                        # Send acknowledgment back to client
                        response = f"Server received: {message}"
                        client_socket.sendall(response.encode('utf-8'))
                        print(f"Sent response: {response}")
                    else:
                        print("No data received")
                        
        except KeyboardInterrupt:
            print("\nServer shutting down...")
            sys.exit(0)

if __name__ == "__main__":
    # Parse command line arguments
    host = sys.argv[1] if len(sys.argv) > 1 else '127.0.0.1'
    port = int(sys.argv[2]) if len(sys.argv) > 2 else 65432
    
    start_server(host, port)
