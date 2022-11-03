import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/pages/profile_pages/settings.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления', SettingsPage()),
    MenuRowData(Icons.library_books, 'Закакзать справку', SettingsPage()),
    MenuRowData(Icons.flag_circle, 'Результаты сессии', SettingsPage()),
  ];
  List<MenuRowData> SecondMenuRow = [
    MenuRowData(Icons.settings, 'Настройки', SettingsPage()),
    MenuRowData(Icons.info, 'О приложении', SettingsPage()),
    MenuRowData(Icons.help, 'Помощь', SettingsPage()),
  ];
  UserProfile({Key? key}) : super(key: key);

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _UserInfo(),
          SizedBox(
            height: 30,
          ),
          _MenuWidget(
            menuRow: firstMenuRow,
          ),
          SizedBox(
            height: 30,
          ),
          _MenuWidget(
            menuRow: SecondMenuRow,
          ),
        ],
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  final Widget widget;

  MenuRowData(this.icon, this.text, this.widget);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: double.infinity,
      child: Column(
          children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList()),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  const _MenuWidgetRow({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => data.widget));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(data.icon),
            SizedBox(
              width: 15,
            ),
            Expanded(child: Text(data.text)),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: double.infinity,
      child: Column(children: [
        SizedBox(height: 20),
        _AvatarWidget(),
        SizedBox(height: 20),
        _UserName(),
        SizedBox(height: 5),
        _PhoneNumber(),
        SizedBox(height: 5),
        _GroupName(),
        SizedBox(height: 5),
      ]),
    );
  }
}

class _GroupName extends StatelessWidget {
  const _GroupName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('УВП-211',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ));
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('21109843@edu.rut-miit.ru',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ));
  }
}

class _UserName extends StatelessWidget {
  const _UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Устинов Константин',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ));
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, child: Placeholder());
  }
}
