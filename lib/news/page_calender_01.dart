import 'package:flutter/material.dart';
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
  CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }


  final Map<DateTime, List> _holidays = {
    DateTime(2021, 1, 1): ['謹賀新年'],
    DateTime(2021, 1, 6): ['Epiphany'],
    DateTime(2021, 2, 16): ['Valentine\'s Day'],
    DateTime(2021, 4, 21): ['Easter Sunday'],
    DateTime(2021, 4, 22): ['Easter Monday'],
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スケジュール'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarController: _calendarController,
              events: _events,
              holidays: _holidays,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                selectedColor: Colors.deepOrange[400],
                todayColor: Colors.deepOrange[200],
                markersColor: Colors.brown[700],
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonTextStyle:
                TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.deepOrange[400],
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              // onDaySelected: _onDaySelected,
              // onVisibleDaysChanged: _onVisibleDaysChanged,
              // onCalendarCreated: _onCalendarCreated,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("予定追加"),
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("保存",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay]
                        .add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [
                      _eventController.text
                    ];
                  }
                  // prefs.setString("events", json.encode(encodeMap(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            )
          ],
        )
    );
  }

}
