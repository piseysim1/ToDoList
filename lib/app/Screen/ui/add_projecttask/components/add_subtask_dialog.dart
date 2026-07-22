import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/data/models/sub_task_item.model.dart';

class AddSubtaskDialog extends StatefulWidget {
  final List<SubTaskItem> subTaskList;
  final VoidCallback onChanged;

  const AddSubtaskDialog({
    super.key,
    required this.subTaskList,
    required this.onChanged,
  });

  static Future<void> show({
    required List<SubTaskItem> subTaskList,
    required VoidCallback onChanged,
  }) {
    return Get.dialog(
      AddSubtaskDialog(subTaskList: subTaskList, onChanged: onChanged),
    );
  }

  @override
  State<AddSubtaskDialog> createState() => _AddSubTaskDialogState();
}

class _AddSubTaskDialogState extends State<AddSubtaskDialog> {
  final _textController = TextEditingController();

  void _addTask() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      widget.subTaskList.add(SubTaskItem(title: text));
      _textController.clear();
    });
    widget.onChanged(); // tells the parent screen to setState() too
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Add New Task',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Enter task title...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF6338E1), width: 2),
                ),
              ),
              onSubmitted: (_) => _addTask(), // hit enter to add & keep typing
            ),
            if (widget.subTaskList.isNotEmpty) ...[
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 180),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.subTaskList.length,
                  itemBuilder: (context, index) {
                    final item = widget.subTaskList[index];
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(item.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                        onPressed: () {
                          setState(() => widget.subTaskList.removeAt(index));
                          widget.onChanged();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Close', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6338E1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: _addTask,
          child: const Text('Add', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}