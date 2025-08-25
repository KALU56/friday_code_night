part of '../home.dart';
// ignore: library_private_types_in_public_api
extension HomeLogic on _HomeState {
  Future<void> loadTasks() async {
    try {
      final tasks = await _taskData.loadTasks();
      setState(() => tasklist = tasks);
      updateCategoryCounts();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load tasks: $e')),
      );
    }
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


}

