import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/models/task_parent_class.dart';
import 'package:task_manager/provider/grpc_provider.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:protos/protos.dart' as proto;

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title, subtitle, description, task;
  String? selectedDate;
  String? selectedTime;
  final List<TaskModel> _tasks = [];

// delete task
  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    setState(() {});
  }

// create task
  void createTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Create Task"),
          backgroundColor: bgColor1,
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: task,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Type something",
                      labelText: "Type something here...",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                      hintStyle: const TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _tasks.add(TaskModel(title: task.text));
                task.clear();
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  // Function to pick date
  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));
    if (date != null) {
      setState(() {
        selectedDate = DateFormat.MMMEd().format(date);
      });
    }
  }

// Function to pick time
  Future<void> pickTime() async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      setState(() {
        selectedTime = DateFormat().add_jm().format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            time.hour,
            time.minute));
      });
    }
  }

  void saveTaskParent() async {
    // throw error if _task is empty
    if (_tasks.isEmpty) {
      Fluttertoast.showToast(
          msg: "Create at least one task",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    if (_formKey.currentState!.validate() &&
        selectedDate!.isNotEmpty &&
        selectedTime!.isNotEmpty) {
      TaskProvider taskProvider =
          Provider.of<TaskProvider>(context, listen: false);
      TaskParentModel taskParent = TaskParentModel(
          title: title.text,
          subtitle: subtitle.text,
          description: description.text,
          date: selectedDate ?? "No date",
          time: selectedTime ?? "No time",
          tasks: _tasks);
      taskProvider.createTaskParent(taskParent);
      await GRPCProvider().createTaskParent(proto.TaskParentModel(
          date: taskParent.date,
          description: taskParent.description,
          subtitle: taskParent.subtitle,
          time: taskParent.time,
          title: taskParent.title,
          tasks: taskParent.tasks
              .map((e) => proto.TaskModel(title: e.title, isDone: e.isDone))
              .toList()));
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    title = TextEditingController();
    subtitle = TextEditingController();
    description = TextEditingController();
    task = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    subtitle.dispose();
    description.dispose();
    task.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff3f37c9),
        title: Text(
          "Create Task",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: grey1, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTask(),
        shape: const CircleBorder(),
        tooltip: 'Save',
        backgroundColor: const Color(0xff3f37c9),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xff3f37c9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title cannot be empty";
                      }
                      TaskModel task = TaskModel(title: title.text);
                      if (_tasks.contains(task)) {
                        Fluttertoast.showToast(
                            msg: "Task already exists",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return "Task already exists";
                      }
                      return null;
                    },
                    maxLength: 100,
                    decoration: InputDecoration(
                        hintText: "Task title",
                        labelText: "Task title",
                        hintStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        counterStyle: const TextStyle(color: Colors.white),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  TextFormField(
                    controller: subtitle,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Subtitle cannot be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Task subtitle",
                        labelText: "Task subtitle",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "When is this due?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => pickTime(),
                          icon: const Icon(Icons.alarm, color: Colors.white)),
                      Text(
                        selectedTime ?? "No time",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async => pickDate(),
                        icon: const Icon(Icons.calendar_month_outlined,
                            color: Colors.white),
                      ),
                      Text(
                        selectedDate ?? "No date",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Description",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: bgColor1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: description,
                maxLength: 200,
                cursorColor: grey1,
                style: TextStyle(color: grey1),
                maxLines: 5,
                decoration: InputDecoration(
                    counterStyle:
                        TextStyle(color: grey1, fontWeight: FontWeight.bold),
                    hintText: "Task description",
                    hintStyle: TextStyle(color: grey1),
                    border: InputBorder.none),
              ),
            ),
            const Gap(20),
            if (_tasks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Progress",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            const Gap(10),
            if (_tasks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Flexible(
                        child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 600),
                            tween: Tween<double>(
                                begin: 0,
                                end: (_tasks
                                            .where((task) => task.isDone)
                                            .length /
                                        _tasks.length)
                                    .toDouble()),
                            curve: Curves.linear,
                            builder: (context, value, _) {
                              return LinearProgressIndicator(
                                backgroundColor: bgColor1,
                                value: value,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(green),
                              );
                            })),
                    const Gap(20),
                    Text(
                        "${(_tasks.where((task) => task.isDone).length / _tasks.length).toDouble() * 100} %",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            const Gap(20),
            if (_tasks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Tasks",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            const Gap(10),
            ..._tasks
                .map(
                  (e) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      deleteTask(e);
                    },
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: bgColor,
                            title: Text("Delete Task",
                                style: TextStyle(
                                    color: grey1, fontWeight: FontWeight.bold)),
                            content: const Text(
                                "Are you sure you want to delete this task?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: grey1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("No",
                                    style: TextStyle(
                                      color: grey1,
                                    )),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor1),
                      child: Column(children: [
                        Row(
                          children: [
                            Radio(
                              value: e.isDone,
                              groupValue: e.isDone,
                              onChanged: (value) {
                                int index = _tasks.indexWhere((element) {
                                  return element.title == e.title;
                                });
                                _tasks[index].toggleDone();
                                setState(() {});
                              },
                              toggleable: true,
                            ),
                            const Gap(10),
                            Flexible(
                              child: Text(
                                e.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: grey1,
                                        fontWeight: FontWeight.bold,
                                        decorationColor: grey1,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 4,
                                        decoration: e.isDone
                                            ? TextDecoration.lineThrough
                                            : null),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                )
                .toList(),
            const Gap(10),
            if (_tasks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff3f37c9),
                    ),
                    onPressed: () {
                      saveTaskParent();
                    },
                    child: const Text(
                      "Save Task",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              )
          ],
        ),
      ),
    );
  }
}
