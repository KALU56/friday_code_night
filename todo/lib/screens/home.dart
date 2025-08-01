import 'package:flutter/material.dart';
import 'package:todo/core/assets.dart';
import 'package:todo/screens/all_detal.dart';
import 'package:todo/widget/continer.dart';
import 'package:todo/widget/continer2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TimeOfDay _timeOfDay = TimeOfDay.now();

  bool isChecked = false;

  List<Map<String, dynamic>> todolist = [
    {
      'title': 'Today',
      'image': AssetImage(Assets.clock),
      'backgroundColor': Color.fromRGBO(181, 194, 251, 1.0),
      'count': 6,
      'onTap': () {},
    },
    {
      'title': 'Schedule',
      'image': AssetImage(Assets.schedule),
      'backgroundColor': Color.fromRGBO(255, 245, 128, 1.0),
      'count': 6,
      'onTap': () {},
    },
    {
      'title': 'All',
      'image': AssetImage(Assets.all),
      'backgroundColor': Color.fromRGBO(208, 245, 235, 1.0),
      'count': 6,
      'onTap': (){}, 
    },
    {
      'title': 'Overdue',
      'image': AssetImage(Assets.over),
      'backgroundColor': Color.fromRGBO(253, 192, 245, 1.0),
      'count': 6,
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
                             
                        children: [
                          ...buildTaskCards(),
                        ],
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
                    Container(),
                    TaskList(
                      title: "project retrospective",
                      day: DateTime.now(),
                      icon: Icons.access_time,
                      time: TimeOfDay.now(),
                      image: AssetImage(Assets.dot),
                    ),
                    /////#1
                    SizedBox(height: 20),
                    TaskList(
                      title: "Evening team meeting",
                      day: DateTime.now(),
                      icon: Icons.access_time,
                      time: TimeOfDay.now(),
                      image: AssetImage(Assets.dot),
                    ),
                    /////#2
                    SizedBox(height: 20),
                    TaskList(
                      title: "Create monthly deck",
                      day: DateTime.now(),
                      icon: Icons.access_time,
                      time: TimeOfDay.now(),
                      image: AssetImage(Assets.dot),
                    ),

                    /////#3
                    SizedBox(height: 20),
                    TaskList(
                      title: "Shop for groceries",
                      day: DateTime.now(),
                      icon: Icons.access_time,
                      time: TimeOfDay.now(),
                      image: AssetImage(Assets.dot),
                    ),
                    /////#4
                    SizedBox(height: 20),
                    TaskList(
                      title: "Read book",
                      day: DateTime.now(),
                      icon: Icons.access_time,
                      time: TimeOfDay.now(),
                      image: AssetImage(Assets.dot),
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
        height: 100,
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'ENTER YOUR TASK')),
            GestureDetector(
              onTap: () {
                _selectTime();
              },
              child: Text(
                '${_timeOfDay.hour}:${_timeOfDay.minute}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      actions: [TextButton(onPressed: (){}, child: Text('save'))],
    ),
  );
  Future<void> _selectTime() async {
    await showTimePicker(initialTime: _timeOfDay, context: context);
    return;
  }
}
