import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/config/globals.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late TextEditingController title, subtitle, description, task;
  String? selectedDate;
  String? selectedTime;

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
                // Add logic to save the task
                Navigator.of(context).pop();
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
      body: ListView(
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
                  decoration: InputDecoration(
                      hintText: "Task title",
                      labelText: "Task title",
                      hintStyle: const TextStyle(color: Colors.white),
                      border: InputBorder.none,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
              maxLength: 300,
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
        ],
      ),
    );
  }
}
