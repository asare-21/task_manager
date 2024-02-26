# Task Manager 

This is a simple implementation of a task manager with live data streams with the help of gRPC

## Folder Structure

This repository has two folders: 
```
task_manager --> :
protos
client
```

Protos folder contains the gRPC definitions used to create the protocol buffers for data transmission. Read more [here](https://grpc.io/docs/languages/dart/).

Client folder contains the task manager app.
```cd client```.
Then run
```flutter pub get``` to install the flutter packages.



## Installation of gRPC server

The server repo can be found [here](https://github.com/asare-21/grpc_server).

Run ```npm install``` to install the packages.

```Always ensure the protos folder in the grpc_server folder is in sync with the protos folder found in the client app``` .

### UI 
[UI Inspritation can be found here](https://dribbble.com/shots/19309032-Task-Management-App)

## Some shots of the app

<img src="https://github.com/asare-21/task_manager/assets/52238457/92ee79ed-33c6-417e-9e4d-f89b335cf79e" alt="" height="500">
<img src="https://github.com/asare-21/task_manager/assets/52238457/c47a4416-6438-43d2-a77b-c93cb4cf5c78" alt="" height="500">
<img src="https://github.com/asare-21/task_manager/assets/52238457/44019baa-de29-4b7c-bb88-80c7b3f496f9" alt="" height="500">
<img src="https://github.com/asare-21/task_manager/assets/52238457/efa55556-fadb-4bd5-9a3e-2a8257192144" alt="" height="500">
<img src="https://github.com/asare-21/task_manager/assets/52238457/0a054bd4-a115-46b1-a366-15f7640cc90f" alt="" height="500">

## Demo
https://github.com/asare-21/task_manager/assets/52238457/8ccfc901-6a23-4ad2-b0dc-4ddefa461839

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

