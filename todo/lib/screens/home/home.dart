
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/assets.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/models/auth.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/models/todolist.dart';
import 'package:todo/screens/home/screen/component/taskcard.dart';
import 'package:todo/screens/home/screen/component/tasklist.dart';

part 'screen/home_ui.dart';
part 'screen/home_dialogs.dart';
part 'screen/home_logic.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.userEmail});

  final UserEmailModel userEmail;

  @override
  State<Home> createState() => _HomeState();
}
