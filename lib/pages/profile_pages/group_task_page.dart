import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/nearest_tile.dart';

class GroupTask extends StatefulWidget {
  @override
  _GroupTaskState createState() => _GroupTaskState();
}

class _GroupTaskState extends State<GroupTask> {
  List<String> grouptasks = [
    "Сделать дз по математике",
    "Сделать дз по физике",
    "Сделать дз по русскому",
    "Сделать дз по английскому",
  ];
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.blue.shade900,
            Colors.blue.shade500,
            Colors.blue.shade400,
          ]),
        ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Общие задания',
            style: TextStyle(color: Colors.black,fontSize: 18,),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child:Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: ListView.builder(
                  itemCount: grouptasks.length,
                  itemBuilder: (context, index) {
                    return NearestTile(
                      nameoftitle: grouptasks[index],
                    );
                  },
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
