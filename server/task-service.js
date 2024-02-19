var grpc = require('@grpc/grpc-js');
console.log(__dirname)
var PROTO_PATH = '../protos/protos/task.proto'; // gRPC
var protoLoader = require('@grpc/proto-loader'); // gRPC
var server = new grpc.Server(); // gRPC


// Suggested options for similarity to existing grpc.load behavior
var packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    });
var taskDescriptor = grpc.loadPackageDefinition(packageDefinition);
// The taskDescriptor object has the full package hierarchy
var routeguide = taskDescriptor.routeguide;

function getTaskParentList() {
    // check if task is in cache
}
function getTaskParentTasks() { 
    
}
function addTask() { }
function deleteTask() { }
function updateTask() { }

function sayHello(call, callback) {
    callback(null, { message: 'Hello ' + call.request.name });
}

function sayHelloAgain(call, callback) {
    callback(null, { message: 'Hello again, ' + call.request.name });
}

function main() {
    server.addService(taskDescriptor.Greeter.service,
        { sayHello: sayHello, sayHelloAgain: sayHelloAgain });
    server.bindAsync('0.0.0.0:50051', grpc.ServerCredentials.createInsecure(), () => {
        server.start();
    });
}

main();