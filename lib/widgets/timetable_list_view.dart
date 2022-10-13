import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/widgets/timetable_tile.dart';

class TimetableListView extends StatefulWidget {
  String date;
  TimetableListView({Key? key, required this.date}) : super(key: key);

  @override
  _TimetableListViewState createState() => _TimetableListViewState();
}

class _TimetableListViewState extends State<TimetableListView> {
  List<String> timetableList = [
    'Лекция\nМатематика,Преподаватель: Антонова Е.В.,Аудитория: 1323,Первая пара 8:30 - 9:50',
    'Лекция\nОбщий курс транспорта,Преподаватель: Сидраков А.А.,Аудитория: 1323,Вторая пара 10:05 - 11:25',
    'Лекция\nМатематика,Преподаватель: Антонова Е.В.,Аудитория: 1323,Первая пара 8:30 - 9:50',
    'Лекция\nОбщий курс транспорта,Преподаватель: Сидраков А.А.,Аудитория: 1323,Вторая пара 10:05 - 11:25',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:timetableList.length,
      itemBuilder: (BuildContext context, int index) {
        return TimetableTile(
          lesson: timetableList[index].split(",")[0],
          theacher:timetableList[index].split(",")[1],
          cabinet: timetableList[index].split(",")[2],
          lesson_number: timetableList[index].split(",")[3],
        );
      },
    );
  }
}
