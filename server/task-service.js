var grpc = require('@grpc/grpc-js');
console.log(__dirname)
var PROTO_PATH = '../protos/protos/task.proto'; // gRPC
var protoLoader = require('@grpc/proto-loader'); // gRPC
const { taskParent, task } = require('./schema/task-parent-schema');
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
function addTaskParent(call, callback) {
    console.log('addTaskParent called')
    console.log(call.request)
    try {
        const tp = taskParent({
            title: call.request.title,
            description: call.request.description,
            subtitle: call.request.subtitle,
            completed: call.request.completed,
            date: call.request.date,
            time: call.request.time
        })
        const { tasks } = call.request

        tasks.forEach(taskElement => {
            tp.tasks.push(task({
                title: taskElement.title,
                isDone: taskElement.isDone
            }))
        })


    }
    catch (e) { }
    callback(null, { message: 'Hello ' + call.request.name });
}


function main() {
    server.addService(taskDescriptor.TaskService.service, {
        getTaskParentList: getTaskParentList,
        getTaskParentTasks: getTaskParentTasks,
        addTask: addTask,
        deleteTask: deleteTask,
        updateTask: updateTask,
        addTaskParent: addTaskParent
    });
    server.bindAsync('0.0.0.0:50051', grpc.ServerCredentials.createInsecure(), () => {
        server.start();
    });
}

main();