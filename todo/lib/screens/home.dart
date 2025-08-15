import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/models/auth.dart';
import 'package:todo/models/tasklist.dart';

import 'package:todo/models/todolist.dart';
import 'package:todo/widgets/taskcard.dart';
import 'package:todo/widgets/tasklist.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.userEmail});

  final UserEmailModel userEmail;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskData _taskData = TaskData();


  final TimeOfDay _timeOfDay = TimeOfDay.now();
  final TextEditingController _datecontroller = TextEditingController();
  final TextEditingController _timecontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();
  bool isChecked = false;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final _formKey = GlobalKey<FormState>();
  List<TodolistModel> todolist = [
    TodolistModel(
      title: 'Today',
      image: AssetImage(Assets.clock),
      backgroundColor: Color.fromRGBO(181, 194, 251, 1.0),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'Schedule',
      image: AssetImage(Assets.schedule),
      backgroundColor: Color.fromRGBO(255, 245, 128, 1.0),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'All',
      image: AssetImage(Assets.all),
      backgroundColor: Color.fromRGBO(208, 245, 235, 1.0),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'Overdue',
      image: AssetImage(Assets.over),
      backgroundColor: Color.fromRGBO(253, 192, 245, 1.0),
      count: 0,
      onTap: () {},
    ),
  ];

  List<TasklistModel> tasklist = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

    void loadTasks() async {
      try {
        final tasks = await _taskData.loadTasks();
        setState(() {
          tasklist = tasks;
        });
        updateCategoryCounts();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load tasks: $e')),
        );
      }
    }
        Future<void> addTask() async {
      if (_selectedDate == null || _selectedTime == null) return;

      await _taskData.addTask(
        title: _titlecontroller.text,
        day: _selectedDate!,
        time: _selectedTime!,
      );

      loadTasks();
      _clearForm();
    }
        Future<void> updateTask(String taskId) async {
      if (_selectedDate == null || _selectedTime == null) return;

      await _taskData.updateTask(
        taskId: taskId,
        title: _titlecontroller.text,
        day: _selectedDate!,
        time: _selectedTime!,
      );

      loadTasks(); 
      _clearForm();
    }
      Future<void> deleteTask(String taskId) async {
    await _taskData.deleteTask(taskId);
    loadTasks();
  }


  void updateCategoryCounts() {
    for (var todo in todolist) {
      todo.count = 0;
    }

    final now = DateTime.now();

    for (var task in tasklist) {
      final taskDateTime = DateTime(
        task.day.year,
        task.day.month,
        task.day.day,
        task.time.hour,
        task.time.minute,
      );
      final isToday =
          task.day.year == now.year &&
          task.day.month == now.month &&
          task.day.day == now.day;
      final isOverdue = taskDateTime.isBefore(now);

      if (isOverdue) {
        todolist[3].count++;
        todolist[2].count++;
      } else if (isToday) {
        todolist[0].count++;
        todolist[1].count++;
        todolist[2].count++;
      } else {
        todolist[1].count++;
        todolist[2].count++;
      }
    }
    setState(() {});
  }

  void _clearForm() {
    _titlecontroller.clear();
    _datecontroller.clear();
    _timecontroller.clear();
    _selectedDate = null;
    _selectedTime = null;
    Navigator.of(context).pop();
  }

  void _showDeleteDialog(String taskId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Task"),
        content: const Text("Are you sure you want to delete this task?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await deleteTask(taskId);
                 if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Task deleted successfully')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to delete task: $e')),
                );
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ${widget.userEmail.email}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text('you have work today'),
                          ],
                        ),

                        Icon(Icons.notification_add),
                      ],
                    ),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      children: todolist
                          .map(
                            (todo) => TaskCard(
                              title: todo.title,
                              image: todo.image,
                              backgroundColor: todo.backgroundColor,
                              count: todo.count,
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Today task',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Column(
                      children: tasklist
                          .map(
                            (task) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TaskList(
                                title: task.title,
                                day: task.day,
                                icon: task.icon ?? Icons.access_time,
                                image:
                                    task.image ??
                                    const AssetImage('assets/images/dot.png'),

                                time: task.time,
                                onEdit: () async {
                                  await openTaskDialog(
                                    isEdit: true,
                                    task: task,
                                  );
                                },
                                onDelete: () => _showDeleteDialog(task.id!),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      openTaskDialog();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openTaskDialog({
    bool isEdit = false,
    TasklistModel? task,
    int? index,
  }) async {
    if (isEdit && task != null) {
      _titlecontroller.text = task.title;
      _selectedDate = task.day;
      _selectedTime = task.time;

      _datecontroller.text = DateFormat.yMEd().format(_selectedDate!);
      _timecontroller.text = _selectedTime!.format(context);
    } else {
      _titlecontroller.clear();
      _datecontroller.clear();
      _timecontroller.clear();
      _selectedDate = null;
      _selectedTime = null;
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEdit ? 'Edit Task' : 'Add New Task'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  hintText: isEdit ? 'Edit your task' : 'Enter your task',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your task';
                  }
                  return null;
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _datecontroller,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectTime(),
                child: TextFormField(
                  controller: _timecontroller,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    prefixIcon: Icon(Icons.access_time),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  readOnly: true,
                  onTap: () => _selectTime(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          Spacer(),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  if (isEdit && task != null) {
                    await updateTask(task.id!);
                  } else {
                    await addTask();
                  }
                  if (!mounted) {
                    return;
                  }
                  // ignore: use_build_context_synchronously
                } catch (e) {
                  if (!mounted) {
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error saving task: $e')),
                  );
                }
              }
            },
            child: Text(isEdit ? 'Update' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      initialTime: _timeOfDay,
      context: context,
    );
    if (picked != null) {
      setState(() {
        final now = DateTime.now();
        final formattedTime = DateFormat.jm().format(
          DateTime(now.year, now.month, picked.hour, picked.minute),
        );
        _timecontroller.text = formattedTime;
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final formttedDate = DateFormat.yMEd().format(picked);
      setState(() {
        _datecontroller.text = formttedDate;
        _selectedDate = picked;
      });
    }
  }
}

extension ImageProviderExtension on ImageProvider {
  String get assetName {
    if (this is AssetImage) {
      return (this as AssetImage).assetName;
    }
    return '';
  }
}
