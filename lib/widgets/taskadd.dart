import 'package:flutter/material.dart';

class TaskAdd extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final TextEditingController dateController;

  const TaskAdd(
      {Key? key,
      required this.titleController,
      required this.descriptionController,
      required this.dateController,})
      : super(key: key);

  @override
  _TaskAddState createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Добавление задания",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "Предмет",
                  fillColor: Colors.white,
                  filled: true,
                  
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "Задание",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "Дата",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
                  color: Colors.blue.shade700,
                  child: TextButton(
                    child: Text(
                      'Добавить',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
