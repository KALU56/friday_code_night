import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/assets.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId = FirebaseAuth.instance.currentUser?.uid;

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final TimeOfDay _nowTime = TimeOfDay.now();

  List<TodolistModel> todolist = [
    TodolistModel(
      title: 'Today',
      image: AssetImage(Assets.clock),
      backgroundColor: const Color(0xFFB5C2FB),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'Schedule',
      image: AssetImage(Assets.schedule),
      backgroundColor: const Color(0xFFFFF580),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'All',
      image: AssetImage(Assets.all),
      backgroundColor: const Color(0xFFD0F5EB),
      count: 0,
      onTap: () {},
    ),
    TodolistModel(
      title: 'Overdue',
      image: AssetImage(Assets.over),
      backgroundColor: const Color(0xFFFDC0F5),
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

  Future<void> loadTasks() async {
    if (_userId == null) return;

    final snapshot = await _firestore
        .collection('user')
        .doc(_userId)
        .collection('tasks')
        .get();

    setState(() {
      tasklist = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return TasklistModel.fromJson(data);
      }).toList();
    });

    updateCategoryCounts();
  }

  Future<void> addTask() async {
    if (_userId == null || _selectedDate == null || _selectedTime == null) {
      return;
    }

    await _firestore.collection('user').doc(_userId).collection('tasks').add({
      'title': _titleController.text,
      'day': _selectedDate!.toIso8601String(),
      'timeHour': _selectedTime!.hour,
      'timeMinute': _selectedTime!.minute,
    });

    _clearForm();
    await loadTasks();
  }

  Future<void> updateTask(String taskId) async {
    if (_userId == null || _selectedDate == null || _selectedTime == null) {
      return;
    }

    await _firestore
        .collection('user')
        .doc(_userId)
        .collection('tasks')
        .doc(taskId)
        .update({
          'title': _titleController.text,
          'day': _selectedDate!.toIso8601String(),
          'timeHour': _selectedTime!.hour,
          'timeMinute': _selectedTime!.minute,
        });

    _clearForm();
    await loadTasks();
  }

  Future<void> deleteTask(String taskId) async {
    if (_userId == null) return;
    await _firestore
        .collection('user')
        .doc(_userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
    await loadTasks();
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
    _titleController.clear();
    _dateController.clear();
    _timeController.clear();
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
            onPressed: () {
              Navigator.pop(context);
              deleteTask(taskId);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

    Future<void> _selectDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          _selectedDate = picked;
          _dateController.text = DateFormat.yMEd().format(picked);
        });
      }
    }
    Future<void> _selectTime() async {
      TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _selectedTime ?? _nowTime,
      );
      if (picked != null) {
        setState(() {
          _selectedTime = picked;
          _timeController.text = picked.format(context);
        });
      }
    }

  Future<void> _openTaskDialog({
  bool isEdit = false,
  TasklistModel? task,
}) async {
  if (isEdit && task != null) {
    _titleController.text = task.title;
    _selectedDate = task.day;
    _selectedTime = task.time;
    _dateController.text = DateFormat.yMd().format(task.day);
    _timeController.text = task.time.format(context);
  } else {
    _clearForm();
  }

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(isEdit ? 'Edit Task' : 'Add New Task'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => 
                    value?.isEmpty ?? true ? 'Please enter a title' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: _selectDate,
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: _selectDate,
                validator: (value) => 
                    value?.isEmpty ?? true ? 'Please select a date' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _timeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: Icon(Icons.access_time),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.schedule),
                    onPressed: _selectTime,
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: _selectTime,
                validator: (value) => 
                    value?.isEmpty ?? true ? 'Please select a time' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context);
              isEdit && task != null 
                  ? updateTask(task.id!) 
                  : addTask();
            }
          },
          child: Text(isEdit ? 'Update' : 'Save'),
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
                                onEdit: () =>
                                    _openTaskDialog(isEdit: true, task: task),
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
                    onPressed: () => _openTaskDialog(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

