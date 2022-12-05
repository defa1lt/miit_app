import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class NearestTile extends StatelessWidget {
  final String nameoftitle;
  NearestTile({super.key, required this.nameoftitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(45, 60, 60, 60),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
            child: Text(nameoftitle, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
          ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
