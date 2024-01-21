import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Lich extends StatefulWidget {
  const Lich({Key? key}) : super(key: key);

  @override
  _LichState createState() => _LichState();
}

class _LichState extends State<Lich> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    String selectedDateText = _selectedDay != null
      ? '${_selectedDay?.day}/${_selectedDay?.month}/${_selectedDay?.year}'
      : '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch'),
        centerTitle: true,
        backgroundColor:Colors.grey,
        leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios_new,), 
             onPressed: () {
              // Hàm được gọi khi nút back được nhấn
              Navigator.pop(context);
            },
          ),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            selectedDayPredicate: (day) {
              // Đặt ngày đã chọn là ngày hiện tại
              return _selectedDay?.year == day.year &&
                  _selectedDay?.month == day.month &&
                  _selectedDay?.day == day.day;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // Đặt ngày được chọn là ngày hiện tại
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay; // Đặt ngày được chọn là ngày hiện tại khi chuyển trang
            },
          ),
          SizedBox(height: 16.0), // Khoảng cách giữa TableCalendar và văn bản
          Text(
          'Ngày được chọn: $selectedDateText',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        ),
        ],
      ),
      
    );
  }
}