import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datecontainer extends StatefulWidget {
  final String title;
  final DateTime initialDate;
  final IconData iconTaskgroup;
  final Color bgIcon;
  final Color iconColor;

  const Datecontainer({
    super.key,
    required this.title,
    required this.initialDate,
    required this.iconTaskgroup,
    required this.bgIcon,
    required this.iconColor,
  });

  @override
  State<Datecontainer> createState() => _GroupTaskDropdownState();
}

class _GroupTaskDropdownState extends State<Datecontainer> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.bgIcon,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                widget.iconTaskgroup,
                color: widget.iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('dd MMM, yyyy').format(selectedDate),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded, 
              color: Colors.black87,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}