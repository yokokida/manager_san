import 'package:flutter/material.dart';
import 'package:manager_san/calender/screen_add.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class SyncCalender extends StatefulWidget {
  @override
  _SyncCalenderState createState() => _SyncCalenderState();
}

class _SyncCalenderState extends State<SyncCalender> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('予定表'),
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            showDatePickerButton: true,
            allowViewNavigation: true,
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEventPage02(
                // chosenDay: _onDaySelected,
              )
              )
          ), // onPressed: _showAddDialog,
        ),
      ),
    );
  }
}

