import 'package:flutter/material.dart';
import 'package:todo/core/assets.dart';
import 'package:todo/screens/all_detal.dart';
import 'package:todo/widget/continer.dart';
import 'package:todo/widget/continer2.dart';
import 'package:intl/intl.dart';

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

  List<Map<String, dynamic>> todolist = [
    {
      'title': 'Today',
      'image': AssetImage(Assets.clock),
      'backgroundColor': Color.fromRGBO(181, 194, 251, 1.0),
      'count': 0,
      'onTap': () {},
    },
    {
      'title': 'Schedule',
      'image': AssetImage(Assets.schedule),
      'backgroundColor': Color.fromRGBO(255, 245, 128, 1.0),
      'count': 0,
      'onTap': () {},
    },
    {
      'title': 'All',
      'image': AssetImage(Assets.all),
      'backgroundColor': Color.fromRGBO(208, 245, 235, 1.0),
      'count': 0,
      'onTap': () {},
    },
    {
      'title': 'Overdue',
      'image': AssetImage(Assets.over),
      'backgroundColor': Color.fromRGBO(253, 192, 245, 1.0),
      'count': 0,
      'onTap': () {},
    },
  ];
  List<Widget> buildTaskCards() {
    List<Widget> cards = [];
    for (int i = 0; i < todolist.length; i++) {
      cards.add(
        TaskCard(
          title: todolist[i]['title'],
          image: todolist[i]['image'],
          backgroundColor: todolist[i]['backgroundColor'],
          count: todolist[i]['count'],
          onTap: todolist[i]['onTap'],
        ),
      );
    }
    return cards;
  }

  List<Map<String, dynamic>> tasklist = [];
  List<Map<String, dynamic>> todayTaskList = [];
  List<Map<String, dynamic>> scheduledTaskList = [];
  List<Map<String, dynamic>> overdue = [];

  List<Widget> buildTaskLists() {
    List<Widget> cards = [];
    for (int i = 0; i < tasklist.length; i++) {
      cards.add(
        TaskList(
          title: tasklist[i]['title'],
          day: tasklist[i]['day'],
          icon: tasklist[i]['icon'],
          time: tasklist[i]['time'],
          image: tasklist[i]['image'],
          // onChecked: (){
          //   tasklist.removeAt(i);
          // },
        ),
      );
    }
    return cards;
  }

  void save() {
    setState(() {
        final now = DateTime.now();
        final isToday = _selectedDate != null &&
                  _selectedDate!.year == now.year &&
                  _selectedDate!.month == now.month &&
                  _selectedDate!.day == now.day;
      tasklist.add({
        'title': _titlecontroller.text,
        'day': _selectedDate,
        'icon': Icons.access_time,
        'time': _selectedTime,
        'image': AssetImage(Assets.dot),
      });
      if (isToday) {
        todolist[0]['count'] = (todolist[0]['count'] ?? 0) + 1;
        todolist[1]['count'] = (todolist[1]['count'] ?? 0) + 1;
        todolist[2]['count'] = (todolist[2]['count'] ?? 0) + 1;
      }else {
         todolist[1]['count'] = (todolist[1]['count'] ?? 0) + 1;
          todolist[2]['count'] = (todolist[2]['count'] ?? 0) + 1;
      }
    });
    Navigator.of(context).pop();
    _titlecontroller.clear();
    _datecontroller.clear();
    _timecontroller.clear();
  }
 void cancel(){
   Navigator.of(context).pop();
 }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                      opensmallscreen();
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

  Future opensmallscreen() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(' add new task'),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(hintText: 'ENTER YOUR TASK'),
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
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
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _selectTime();
              },

              child: TextField(
                controller: _timecontroller,
                decoration: InputDecoration(
                  labelText: 'time',
                  prefixIcon: Icon(Icons.access_time),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectTime();
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
       
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                cancel();
              },
              child: Text('cancel'),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                save();
              },
              child: Text('save'),
            ),
          ],
        ),
      ],
    ),
  );
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
