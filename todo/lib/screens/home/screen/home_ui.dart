
part of '../home.dart';

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

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildContent(),
            _buildFloatingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildCategoryGrid(),
            const SizedBox(height: 15),
            _buildTodayTasks(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${widget.userEmail.email}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('you have work today'),
          ],
        ),
        const Icon(Icons.notification_add),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: todolist
          .map((todo) => TaskCard(
                title: todo.title,
                image: todo.image,
                backgroundColor: todo.backgroundColor,
                count: todo.count,
              ))
          .toList(),
    );
  }

  Widget _buildTodayTasks() {
    return Column(
      children: tasklist
          .map((task) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TaskList(
                  title: task.title,
                  day: task.day,
                  icon: task.icon ?? Icons.access_time,
                  image: task.image ??
                      const AssetImage('assets/images/dot.png'),
                  time: task.time,
                  onEdit: () async =>
                      await openTaskDialog(isEdit: true, task: task),
                  onDelete: () => _showDeleteDialog(task.id!),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildFloatingButton() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => openTaskDialog(),
          ),
        ),
      ),
    );
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
