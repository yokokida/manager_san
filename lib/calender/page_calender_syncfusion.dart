import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SyncCalender extends StatefulWidget {
  @override
  _SyncCalenderState createState() => _SyncCalenderState();
}

class _SyncCalenderState extends State<SyncCalender> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
            ),
          ),
        ),
      ),
    );
  }
}

