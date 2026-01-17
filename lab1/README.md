# Lab 1: Socket Programming - Message Sending and Receiving

This lab demonstrates basic socket programming with a TCP server and client that can send and receive messages over the network.

## Files

- `server.py` - TCP socket server that receives messages from clients
- `client.py` - TCP socket client that sends messages to the server

## Requirements

- Python 3.x

## Usage

### Starting the Server

To start the server on default settings (localhost:65432):

```bash
python3 server.py
```

To start the server on a custom host and port:

```bash
python3 server.py <host> <port>
```

Example:
```bash
python3 server.py 0.0.0.0 8080
```

The server will listen for incoming connections and display received messages.

### Running the Client

To send a message to the server:

```bash
python3 client.py "Your message here"
```

To connect to a custom host and port:

```bash
python3 client.py "Your message here" <host> <port>
```

Example:
```bash
python3 client.py "Hello, Server!" 127.0.0.1 65432
```

## How It Works

1. **Server**: 
   - Creates a TCP socket and binds it to a host and port
   - Listens for incoming connections
   - Accepts client connections
   - Receives messages from clients
   - Sends acknowledgment responses back to clients

2. **Client**:
   - Creates a TCP socket
   - Connects to the server
   - Sends a message to the server
   - Receives and displays the server's response

## Example Session

Terminal 1 (Server):
```bash
$ python3 server.py
Server listening on 127.0.0.1:65432

Connection from ('127.0.0.1', 54321)
Received message: Hello, Server!
Sent response: Server received: Hello, Server!
```

Terminal 2 (Client):
```bash
$ python3 client.py "Hello, Server!"
Connecting to server at 127.0.0.1:65432
Connected to server
Sending message: Hello, Server!
Received response: Server received: Hello, Server!
```

## Notes

- The server will continue running until stopped with Ctrl+C
- Each client connection is handled one at a time
- Messages are limited to 1024 bytes
- The server uses SO_REUSEADDR to allow quick restarts
