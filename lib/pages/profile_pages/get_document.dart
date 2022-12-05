import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';

class GetPage extends StatefulWidget {
  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.check),
          backgroundColor: Colors.blue.shade700,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Заказать справку',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
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
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: DropDownListView(
                    elements: [
                      [
                        "в УСЗН",
                        "в Фонд социального страхования",
                        "в ЦСО (Центр социального обслуживания населения)"
                      ],
                      ['1', '2'],
                      [
                        'в газовую службу',
                        'на вывоз мусора',
                        'в ЖКХ',
                        'в ТСЖ',
                        'в Горгаз',
                        'в Водоканал',
                        'в отдел жилищных субсидий',
                      ],
                      ['1', '2'],
                      [
                        'в общежитие',
                        'по месту работы родителей',
                        'по месту работы',
                        'в железнодорожную кассу',
                      ],
                      ['1', '2'],
                      [
                        'в налоговую инспекцию',
                        'в посольство (указать страну ниже)',
                        'в консульство (указать страну ниже)',
                        'в визовый центр',
                        'в школу',
                        'в детский сад',
                      ],
                      ['1', '2'],
                    ],
                    names: [
                      'Место предоставления',
                      'Количество экземпляров',
                      'Место предоставления',
                      'Количество экземпляров',
                      'Место предоставления',
                      'Количество экземпляров',
                      'Место предоставления',
                      'Количество экземпляров',
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  List<String> element;
  String name;
  DropDown({Key? key, required this.element, required this.name})
      : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 10),
              child: Text(widget.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
            child: AwesomeDropDown(
              dropDownList: widget.element,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class DropDownListView extends StatefulWidget {
  List<List<String>> elements;
  List<String> names;
  DropDownListView({Key? key, required this.elements, required this.names})
      : super(key: key);

  @override
  _DropDownListViewState createState() => _DropDownListViewState();
}

class _DropDownListViewState extends State<DropDownListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.names.length,
      itemBuilder: (BuildContext context, int index) {
        return DropDown(
          name: widget.names[index],
          element: widget.elements[index],
        );
      },
    );
  }
}
