import 'package:miit_app/widgets/notification_service.dart';
import 'package:miit_app/widgets/timetable_tile.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';

late final LocalNotificationService service;

 Future<void> _getTimeTableListApi(String date) async {
    
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    String s = '';
    String dayName = '';
    String lessonTime = '';
    List<String> timetableList = [];
    var id = 0;
    timetableList.clear();
    var data = json.decode(
        (await http.get(Uri.parse("http://89.208.221.228/api/timetables/")))
            .body);
    TimeTables timeTable = TimeTables.fromJson(data);
    await service.cancelAll();
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
        lessonTime = '16:55 - 18:15 ';
      }
      if (i.lessonNumber == 7) {
        lessonTime = '18:30 - 19:50';
      }
      if (i.lessonNumber == 8) {
        lessonTime = '20:05 - 21:25';
      }

      var date = DateTime.now();
      if (i.weekParity == 1) {
        if (i.dayNumber == 1) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 29, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 29, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 29, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 29, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 29, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 29, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 29, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 29, 20);
          }
        }
        if (i.dayNumber == 2) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 30, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 30, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 30, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 30, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 30, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 30, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 30, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 30, 20);
          }
        }
        if (i.dayNumber == 3) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 31, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 31, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 31, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 31, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 31, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 31, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 31, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 31, 20);
          }
        }
        if (i.dayNumber == 4) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 1, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 1, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 1, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 1, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 1, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 1, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 1, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 1, 20);
          }
        }
        if (i.dayNumber == 5) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 2, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 2, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 2, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 2, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 2, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 2, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 2, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 2, 20);
          }
        }
      }
      if (i.weekParity == 2) {
        if (i.dayNumber == 1) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 5, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 5, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 5, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 5, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 5, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 5, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 5, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 5, 20);
          }
        }
        if (i.dayNumber == 2) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 6, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 6, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 6, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 6, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 6, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 6, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 6, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 6, 20);
          }
        }
        if (i.dayNumber == 3) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 7, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 7, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 7, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 7, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 7, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 7, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 7, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 7, 20);
          }
        }
        if (i.dayNumber == 4) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 8, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 8, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 8, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 8, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 8, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 8, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 8, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 8, 20);
          }
        }
        if (i.dayNumber == 5) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 9, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 9, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 9, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 9, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 9, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 9, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 9, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 9, 20);
          }
        }
      }

      await service.setnotifications(
          id: id,
          title: '${i.lesson[0].type} ${i.lesson[0].name}',
          body: 'Начало через 5 минут в аудитории ${i.location[0].number}',
          date: date);
      s = '${i.lesson[0].type},${i.lesson[0].name},${i.teacher[0].firstName} ${i.teacher[0].lastName} ${i.teacher[0].middleName},${i.location[0].number},$lessonTime,$dayName,${i.weekParity}';
      timetableList.add(s);
      id++;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('timetable', timetableList);
  }
  
  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');
    }
  }