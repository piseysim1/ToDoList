import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const HorizontalCalendar({super.key, required this.onDateSelected});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendar();
}

class _HorizontalCalendar extends State<HorizontalCalendar> {
  DateTime _selectedDate = DateTime.now();
  late List<DateTime> _days;
  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _days = List.generate(15, (index) => today.add(Duration(days: index - 2)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _days.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = _days[index];
          final isSelected = DateUtils.isSameDay(date, _selectedDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              widget.onDateSelected(date);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 65,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF6338E1) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Month Name: May
                  Text(
                    DateFormat('MMM').format(date),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF6338E1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Day Number : 25
                  Text(
                    DateFormat('dd').format(date),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Weekday Name : Sun
                  Text(
                    DateFormat('E').format(date),
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
