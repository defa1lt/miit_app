import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/main.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String countDoneTask = '0';
  String countUndoneTask = '0';
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Задания',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        //onTap: ,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_month,
                                        color: Colors.blue.shade700),
                                    Expanded(child: Text('')),
                                    Text(
                                      countDoneTask,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: Text('')),
                              Container(
                                  margin: const EdgeInsets.only(
                                      top: 30, bottom: 30, left: 10, right: 10),
                                  child: Text(
                                    'Выполненые',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
