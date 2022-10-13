import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/widgets/timetable_list_view.dart';

class WeekPage extends StatefulWidget {
  @override
  _WeekPageState createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade500,
          Colors.blue.shade400,
        ]),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Рассписание',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
            CalendarTimeline(
              showYears: false,
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(
                2022,
                12,
                31,
              ),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20,
              monthColor: Colors.white70,
              dayColor: Colors.white70,
              dayNameColor: Colors.white70,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.blue.shade500,
              dotsColor: Colors.white70,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'ru',
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              boxShadow: [BoxShadow(blurRadius: 10.0)]),
                          child:
                              TimetableListView(date: _selectedDate.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
