const { model, Schema } = require('mongoose');

const taskParentSchema = new Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: false
    },
    subtitle: {
        type: String,
        required: false
    },
    completed: {
        type: Boolean,
        default: false
    },
    date: {
        type: String,
        required: true
    },
    time: {
        type: String,
        required: true
    },

}, { timestamps: true });

const taskSchema = new Schema({
    parent: {
        type: Schema.Types.ObjectId,
        ref: "TaskParent",
        required: true
    },
    title: {
        type: String,
        required: true
    },
    isDone: {
        type: Boolean,
        default: false
    }
}, { timestamps: true });



module.exports.taskParent = model("TaskParent", taskParentSchema);
module.exports.task = model("Task", taskSchema);
