import 'package:flutter/material.dart';
import 'package:manager_san/calender/screen_add.dart';
import 'package:table_calendar/table_calendar.dart';


class Calender01Page extends StatefulWidget {
  @override
  _Calender01PageState createState() => _Calender01PageState();
}

class _Calender01PageState extends State<Calender01Page> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  TextEditingController _descriptionController;
  CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _descriptionController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }


  final Map<DateTime, List> _holidays = {
    DateTime(2021, 1, 1): ['謹賀新年'],
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スケジュール'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TableCalendar(
              calendarController: _calendarController,
              holidays: _holidays,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              initialCalendarFormat: CalendarFormat.month,
              formatAnimation: FormatAnimation.scale,

              events: _events,

              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonVisible: false,
              ),

              calendarStyle: CalendarStyle(
                todayColor: Colors.deepOrangeAccent,
                selectedColor: Colors.lightBlueAccent,
                markersColor: Colors.lightBlueAccent,
                outsideDaysVisible: true,
                weekendStyle: TextStyle().copyWith(color: Colors.deepOrange),
                holidayStyle: TextStyle().copyWith(color: Colors.deepOrange),
              ),
              onDaySelected: _onDaySelected,
              onVisibleDaysChanged: _onVisibleDaysChanged,
              onCalendarCreated: _onCalendarCreated,
            ),

            ..._selectedEvents.map((event) => ListTile(
              title: Text(event.title),
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (_) => EventDetailsPage(event: event)
              //       )
              //   );
              // },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEventPage02(
              // chosenDay: _onDaySelected,
            ))
        ),
        // onPressed: _showAddDialog,
      ),
    );
  }

  _onDaySelected(DateTime day, List events, List holidays) {
    print(day);
    setState(() {
      _selectedEvents = events;
    });
    return day;
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }
}
