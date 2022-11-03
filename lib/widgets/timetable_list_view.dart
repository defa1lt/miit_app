import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/widgets/timetable_tile.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api.dart';

extension DateWeekExtensions on DateTime {
  int get isoWeekOfYear {
    // Get the monday of week 1
    final DateTime mondayWeek1 = _isoWeek1Monday();

    if (isBefore(mondayWeek1)) {
      return DateTime(year - 1, 12, 31).isoWeekOfYear;
    }

    final int ordinalWeek1Monday = mondayWeek1.ordinalDate();
    final int ordinal = ordinalDate();

    int diffInDays = ordinal - ordinalWeek1Monday;
    if (year > mondayWeek1.year) {
      diffInDays += 365;
      if (isLeapYear && DateTime(year, 2, 29).isBefore(this)) {
        diffInDays += 1;
      }
    }
    int week = (diffInDays ~/ 7) + 1;
    if (week == 53 && weekday < DateTime.thursday) {
      return 1;
    }
    return week;
  }

  int ordinalDate() {
    final DAYS_IN_MONTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    final monthsBefore = DAYS_IN_MONTH.getRange(0, month - 1);

    int days = monthsBefore.length > 0
        ? monthsBefore.reduce((value, element) => value + element)
        : 0;

    if (month > 2 && isLeapYear) {
      days += 1;
    }

    return days + day;
  }

  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  DateTime _isoWeek1Monday() {
    final jan4 = DateTime(year, 1, 4); // Jan 4 is always in week 1

    return DateTime(
      jan4.year,
      jan4.month,
      jan4.day - jan4.weekday + 1,
    );
  }
}

class TimetableListView extends StatefulWidget {
  String date;
  TimetableListView({Key? key, required this.date}) : super(key: key);

  @override
  _TimetableListViewState createState() => _TimetableListViewState();
}

class _TimetableListViewState extends State<TimetableListView> {
  String s = '';
  String dayName = '';
  String lessonTime = '';
  List<String> timetableList = [
    'Лекция,Математика,Антонова Е.В.,1323,8:30 - 9:50,чт,1',
    'Лекция,Общий курс транспорта,Сидраков А.А.,1323,10:05 - 11:25,чт,1',
    'Лекция,Технология программирования,Новиков А.И.,1541,13:45 - 15:05,вт,1',
    'Практическое занятие,Дискретная математика и математическая логика,Сидраков А.А,1541,15:20 - 16:40,вт,1',
    'Лекция,Дискретная математика и математическая логика,Сидраков А.А,1541,16:55 - 18:15,вт,1',
    'Лабораторная работа,Основы информационной безопасности,Голдовский Я.М. Цыганова Н.А.,1330,13:45 - 15:05,ср,1',
    'Лекция,Основы информационной безопасности,Цыганова Н.А.,1323,15:20 - 16:40,ср,1',
    'Лекция,Физика,Иванова Е.В.,1323,16:55 - 18:15,ср,1',
    'Лекция,Математика,Антонова Е.В.,1323,8:30 - 9:50,пн,2',
    'Лекция,Общий курс транспорта,Сидраков А.А.,1323,10:05 - 11:25,пн,2',
    'Практическое занятие,Английский язык,Гасанова Ф.Р.,1320,11:40 - 13:00,пн,2',
    'Лекция,Технология программирования,Новиков А.И.,1541,13:45 - 15:05,вт,2',
    'Практическое занятие,Дискретная математика и математическая логика,Сидраков А.А,1541,15:20 - 16:40,вт,2',
    'Лекция,Дискретная математика и математическая логика,Сидраков А.А,1541,16:55 - 18:15,вт,2',
    'Лабораторная работа,Основы информационной безопасности,Голдовский Я.М. Цыганова Н.А.,1330,13:45 - 15:05,ср,2',
    'Лекция,Основы информационной безопасности,Цыганова Н.А.,1323,15:20 - 16:40,ср,2',
    'Лекция,Физика,Иванова Е.В.,1323,16:55 - 18:15,ср,2',
  ];

  Future<void> _getTimeTableListApi() async {
    timetableList.clear();
    var data = json.decode(
        (await http.get(Uri.parse("http://89.208.221.228/api/timetables/")))
            .body);
    TimeTables timeTable = TimeTables.fromJson(data);
    for (var i in timeTable.timetables) {
      if (i.dayNumber == 1) {
        dayName = 'пн';
      }
      if (i.dayNumber == 2) {
        dayName = 'вт';
      }
      if (i.dayNumber == 3) {
        dayName = 'ср';
      }
      if (i.dayNumber == 4) {
        dayName = 'чт';
      }
      if (i.dayNumber == 5) {
        dayName = 'пт';
      }
      if (i.lessonNumber == 1) {
        lessonTime = '8:30 - 9:50';
      }
      if (i.lessonNumber == 2) {
        lessonTime = '10:05 - 11:25';
      }
      if (i.lessonNumber == 3) {
        lessonTime = '11:40 - 13:00';
      }
      if (i.lessonNumber == 4) {
        lessonTime = '13:45 - 15:05';
      }
      if (i.lessonNumber == 5) {
        lessonTime = '15:20 - 16:40';
      }
      if (i.lessonNumber == 6) {
        lessonTime = '16:55 - 18:15';
      }
      s = '${i.lesson[0].type},${i.lesson[0].name},${i.teacher[0].firstName} ${i.teacher[0].lastName} ${i.teacher[0].middleName},${i.location[0].number},$lessonTime,$dayName,${i.weekParity}';
      timetableList.add(s);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int weeknum = 0;
    var selectedDate = widget.date;
    var _selectedDate = selectedDate.characters.take(10).toString().split('-');
    if ((DateTime(int.parse(_selectedDate[0]), int.parse(_selectedDate[1]),
                        int.parse(_selectedDate[2]))
                    .isoWeekOfYear -
                DateTime(2022, 9, 1).isoWeekOfYear) %
            2 ==
        0) {
      weeknum = 1;
    } else {
      weeknum = 2;
    }
    String dayname = DateFormat.E('ru').format(DateTime(
        int.parse(_selectedDate[0]),
        int.parse(_selectedDate[1]),
        int.parse(_selectedDate[2])));

    List<String> type = [];
    List<String> lesson = [];
    List<String> theacher = [];
    List<String> cabinet = [];
    List<String> lesson_number = [];
    for (String i in timetableList) {
      if (i.split(',')[5] == dayname && i.split(',')[6] == weeknum.toString()) {
        type.add(i.split(",")[0]);
        lesson.add(i.split(",")[1]);
        theacher.add(i.split(",")[2]);
        cabinet.add(i.split(",")[3]);
        lesson_number.add(i.split(",")[4]);
      }
    }
    return RefreshIndicator(
      onRefresh: _getTimeTableListApi,
      child: ListView.builder(
        itemCount: lesson.length,
        itemBuilder: (BuildContext context, int index) {
          return TimetableTile(
            type: type[index],
            lesson: lesson[index],
            theacher: theacher[index],
            cabinet: cabinet[index],
            lesson_number: lesson_number[index],
          );
        },
      ),
    );
  }
}
