import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/assets.dart';

import 'package:todo/models/tasklist.dart';

import 'package:todo/models/todolist.dart';
import 'package:todo/widget/continer.dart';

import 'package:todo/widget/continer2.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final TimeOfDay _timeOfDay = TimeOfDay.now();
  final TextEditingController _datecontroller = TextEditingController();
  final TextEditingController _timecontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();
  bool isChecked = false;

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
  List<Widget> buildTaskCards() {
    List<Widget> cards = [];
    for (int i = 0; i < todolist.length; i++) {
      cards.add(
        TaskCard(
          title: todolist[i].title,
          image: todolist[i].image,
          backgroundColor: todolist[i].backgroundColor,
          count: todolist[i].count,
        ),
      );
    }
    return cards;
  }

  List<TasklistModel> tasklist = [];

  List<Widget> buildTaskLists() {
    List<Widget> cards = [];
    for (int i = 0; i < tasklist.length; i++) {
      cards.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TaskList(
            title: tasklist[i].title,
            day: tasklist[i].day,
            icon: tasklist[i].icon,
            time: tasklist[i].time,
            image: tasklist[i].image,
            onEdit: () async {
              await openTaskDialog(isEdit: true, task: tasklist[i], index: i);
            },
            onDelete: () {
              deleteTaskListToPrefs();
            },
          ),
        ),
      );
    }
    return cards;
  }

  Future<void> saveTaskListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> jsonList = tasklist
        .map(
          (task) => {
            'title': task.title,
            'day': task.day.toIso8601String(),
            'time': '${task.time.hour}:${task.time.minute}',
            'icon': task.icon.codePoint,
            'image': task.image.assetName,
          },
        )
        .toList();

    String jsonString = jsonEncode(jsonList);
    await prefs.setString('tasklist', jsonString);
  }

  Future<void> loadTaskListFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('tasklist');

    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);

      setState(() {
        tasklist = jsonList
            .map(
              (json) => TasklistModel(
                title: json['title'],
                day: DateTime.parse(json['day']),
                icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
                time: TimeOfDay(
                  hour: int.parse(json['time'].split(':')[0]),
                  minute: int.parse(json['time'].split(':')[1]),
                ),
                image: AssetImage(json['image']),
              ),
            )
            .toList();
      });

      CategoryCounts();
    }
  }

  void CategoryCounts() {
 
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
        todolist[3].count += 1; 
        todolist[2].count += 1; 
      } else if (isToday) {
        todolist[0].count += 1;
        todolist[1].count += 1; 
        todolist[2].count += 1; 
      } else {
        todolist[1].count += 1; 
        todolist[2].count += 1; 
      }
    }
  }

  Future<void> deleteTaskListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('tasklist');

    setState(() {
      tasklist.clear();
    });
    recalculatedCategoryCounts();
  }

  void recalculatedCategoryCounts() {
    setState(() {
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
        todolist[3].count -= 1; 
        todolist[2].count -= 1;
      } else if (isToday) {
        todolist[0].count -= 1; 
        todolist[1].count -= 1; 
        todolist[2].count -= 1;
      } else {
        todolist[1].count -= 1; 
        todolist[2].count -= 1; 
      }
    }

    });
  }
    void addNewTask() async {
      setState(() {
        tasklist.add(
          TasklistModel(
            title: _titlecontroller.text,
            day: _selectedDate!,
            time: _selectedTime!,
            icon: Icons.access_time,
            image: AssetImage(Assets.dot),
          ),
        );
      });

      await saveTaskListToPrefs();
      CategoryCounts();
      Navigator.of(context).pop();
    }
  void updateTask(int index) async{
    setState(() {
      tasklist[index] = TasklistModel(
        title: _titlecontroller.text,
        day: _selectedDate!,
        icon: Icons.access_time,
        time: _selectedTime!,
        image: AssetImage(Assets.dot),
      );
    });
     await saveTaskListToPrefs();
     CategoryCounts(); 
    Navigator.of(context).pop();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    loadTaskListFromPrefs();
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
                              'Hello jack',
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

                      children: [...buildTaskCards()],
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

                    Column(children: [...buildTaskLists()]),
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (isEdit && index != null) {
                  updateTask(index);
                } else {
                  addNewTask();
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
