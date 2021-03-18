import 'package:flutter/material.dart';
import 'package:manager_san/news/add_news.dart';
import 'package:manager_san/news/screen_news.dart';
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
            MaterialPageRoute(builder: (context) => AddEventPage02())
        ),
        // onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("予定追加"),
          content: Container(
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _eventController,
                ),
                TextField(
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                FlatButton(
                  child: Text("キャンセル",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text("保存",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    setState(() {
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay].add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [_eventController.text];
                      }
                      // prefs.setString("events", json.encode(encodeMap(_events)));
                      _eventController.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            )
          ],
        )
    );
  }


  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }
}
