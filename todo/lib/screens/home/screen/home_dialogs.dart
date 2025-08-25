
part of '../home.dart';

extension HomeDialogs on _HomeState {
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
                  const SnackBar(content: Text('Task deleted successfully')),
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
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter your task' : null,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _datecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please enter date' : null,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectTime(),
                child: TextFormField(
                  controller: _timecontroller,
                  decoration: const InputDecoration(
                    labelText: 'Time',
                    prefixIcon: Icon(Icons.access_time),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter time' : null,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          const Spacer(),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  if (isEdit && task != null) {
                    await updateTask(task.id!);
                  } else {
                    await addTask();
                  }
                } catch (e) {
                  if (!mounted) return;
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
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute),
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
      final formattedDate = DateFormat.yMEd().format(picked);
      setState(() {
        _datecontroller.text = formattedDate;
        _selectedDate = picked;
      });
    }
  }
}
