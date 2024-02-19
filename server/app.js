var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var app = express(); // gRPC
var grpc = require('@grpc/grpc-js');
var PROTO_PATH = __dirname + '../protos/protos/task.proto'; // gRPC
var protoLoader = require('@grpc/proto-loader'); // gRPC
var Server = new grpc.Server(); // gRPC
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);


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



module.exports = app;


