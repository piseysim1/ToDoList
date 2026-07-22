import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app/app/Screen/ui/todaytask/components/aurora_background.dart';
import 'package:todolist_app/app/controllers/td_controller/todaytask_controller.dart';
import 'package:todolist_app/app/data/models/taskModel.model.dart';

class SubTaskItem {
  String title;
  bool isCompleted;

  SubTaskItem({required this.title, this.isCompleted = false});
}

class AddProjecttaskView extends StatefulWidget {
  const AddProjecttaskView({super.key});

  @override
  State<AddProjecttaskView> createState() => _AddProjecttaskViewState();
}

class _AddProjecttaskViewState extends State<AddProjecttaskView> {
  final TodaytaskController controller = Get.find<TodaytaskController>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));

  String selectedTaskGroup = 'Work';
  TaskModel? existingTask;
  bool isEditMode = false;

  // List to hold multiple tasks under "All Task"
  List<SubTaskItem> subTaskList = [
    SubTaskItem(title: 'Buy Cafe at Brown cafe'),
  ];

  @override
  void initState() {
    super.initState();

    if (Get.arguments != null && Get.arguments is TaskModel) {
      existingTask = Get.arguments as TaskModel;
      isEditMode = true;

      titleController.text = existingTask!.title;
      descriptionController.text = existingTask!.category;
      selectedTaskGroup = existingTask!.status;
    }
  }

  void _showAddSubTaskDialog() {
    final subTaskTextController = TextEditingController();

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Add New Task',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        content: TextField(
          controller: subTaskTextController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter task title...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6338E1), width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6338E1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (subTaskTextController.text.trim().isNotEmpty) {
                setState(() {
                  subTaskList.add(
                    SubTaskItem(title: subTaskTextController.text.trim()),
                  );
                });
                Get.back();
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _saveTask() {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a project name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      return;
    }

    if (isEditMode && existingTask != null) {
      final updated = TaskModel(
        id: existingTask!.id,
        title: titleController.text.trim(),
        category: descriptionController.text.trim(),
        time: DateFormat('hh:mm a').format(startDate),
        status: selectedTaskGroup,
        date: startDate,
      );
      controller.updateTask(updated);
    } else {
      final newTask = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: titleController.text.trim(),
        category: descriptionController.text.trim(),
        time: DateFormat('hh:mm a').format(startDate),
        status: selectedTaskGroup,
        date: startDate,
      );
      controller.addTask(newTask);
    }

    Get.back();
  }

  void _deleteTask() {
    if (existingTask != null) {
      controller.deleteTask(existingTask!.id);
      Get.back();
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          isEditMode ? 'Edit Project' : 'Add Project',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          if (isEditMode)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: _deleteTask,
            )
          else
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
        ],
      ),
      body: AuroraBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // 1. Task Group Card
              _buildCardContainer(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.card_travel,
                        color: Colors.pinkAccent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Task Group',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:
                                  [
                                    'Work',
                                    'Personal',
                                    'Study',
                                  ].contains(selectedTaskGroup)
                                  ? selectedTaskGroup
                                  : 'Work',
                              isDense: true,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              items: ['Work', 'Personal', 'Study']
                                  .map(
                                    (group) => DropdownMenuItem(
                                      value: group,
                                      child: Text(group),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                if (val != null)
                                  setState(() => selectedTaskGroup = val);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 2. Project Name Card
              _buildCardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Project Name',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 6),
                        border: InputBorder.none,
                        hintText: 'Grocery Shopping App',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 3. Description Card
              _buildCardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText:
                            'This application is designed for super shops...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 4. Start Date Card
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: _buildCardContainer(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Color(0xFF6338E1),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Start Date',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              DateFormat('dd MMMM, yyyy').format(startDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 5. End Date Card
              GestureDetector(
                onTap: () => _selectDate(context, false),
                child: _buildCardContainer(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Color(0xFF6338E1),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'End Date',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              DateFormat('dd MMMM, yyyy').format(endDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 6. "All Task" Header Section
              const Text(
                'All Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Dynamic List of Tasks
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subTaskList.length,
                itemBuilder: (context, index) {
                  final item = subTaskList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildCardContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: item.isCompleted
                                    ? Colors.grey
                                    : Colors.black,
                                decoration: item.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item.isCompleted = !item.isCompleted;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: item.isCompleted
                                    ? const Color(0xFF6338E1)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: item.isCompleted
                                      ? const Color(0xFF6338E1)
                                      : Colors.grey.shade400,
                                  width: 2,
                                ),
                              ),
                              child: item.isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              // Floating Square Plus Button to Add New Tasks (Right aligned as in design image)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _showAddSubTaskDialog,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6338E1),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6338E1).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 7. Add / Update Project Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6338E1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _saveTask,
                  child: Text(
                    isEditMode ? 'Update Project' : 'Add Project',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
