import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/main.dart';
import 'package:miit_app/widgets/nearest_tile.dart';
import 'package:miit_app/pages/profile_pages/local_page.dart';
import 'package:miit_app/widgets/taskadd.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/profile_pages/done_page.dart';
import '../pages/profile_pages/group_task_page.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String countLocalTask = '0';
  String countGroupTask = '0';
  String countAllDoneTask = '0';
  List<String> title = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setStringList('Предмет', title);
          showDialog(
              context: context,
              builder: (context) {
                return TaskAdd(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  dateController: dateController, 
                );
              }
              )
              .then((value) {
            setState(() {
              if (descriptionController.text == "" ||
                  titleController.text == "") {
                showInSnackBar("Поля не могут быть пустыми!");
              } else {
                title.add(
                    "(${titleController.text}: ${descriptionController.text}  ${dateController.text}");
                titleController.clear();
                descriptionController.clear();
                dateController.clear();
              }
            });
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
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
                  child: Column(
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LocalTask()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(45, 60, 60, 60),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 47,
                                          height: 47,
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade700,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: Icon(Icons.person,
                                              color: Colors.white, size: 37),
                                        ),
                                        Expanded(child: Text('')),
                                        Text(
                                          countLocalTask,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 35,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Text('')),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 30,
                                          bottom: 30,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                        'Локальные',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => GroupTask()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(45, 60, 60, 60),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 47,
                                          height: 47,
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade700,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: Icon(Icons.group,
                                              color: Colors.white, size: 37),
                                        ),
                                        Expanded(child: Text('')),
                                        Text(
                                          countGroupTask,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 35,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Text('')),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 10,
                                        right: 10),
                                    child: Text(
                                      'Общие',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DoneTask()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Card(
                                  color: Colors.white54,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: 47,
                                              height: 47,
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade700,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              ),
                                              child: Icon(Icons.done,
                                                  color: Colors.white,
                                                  size: 37),
                                            ),
                                            Text(
                                              countAllDoneTask,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: Text(
                                            'Выполненные',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text('Ближайшие',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              Expanded(child: Text('')),
                              Icon(Icons.expand_more)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: title.length,
                            itemBuilder: (context, index) {
                              return NearestTile(
                                nameoftitle: title[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue.shade700,
        content: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
