import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  const DateTimeDemo({ Key? key }) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate () async {
    final date = await showDatePicker(
      context: context, 
      initialDate: _selectedDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100)
    );
    if(date == null) {
      return;
    }else {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _selectTime () async {
    final time = await showTimePicker(
      context: context, 
      initialTime: _selectedTime
    );
    if(time == null) {
      return;
    }else {
      setState(() {
        _selectedTime = time;
      });
    }
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTimeDemo'),
        elevation: 10.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: [
                      Text(DateFormat.yMd().format(_selectedDate)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  )
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: [
                      Text(_selectedTime.format(context)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}