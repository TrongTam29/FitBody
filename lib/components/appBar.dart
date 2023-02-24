import 'package:flutter/material.dart';

// ignore: camel_case_types
class AppBar_Components extends StatelessWidget {
  const AppBar_Components({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.chevron_left_outlined),
        onPressed: () {},
        tooltip: 'Back',
        iconSize: 30,
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'AdventPro',
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_horiz_outlined),
          onPressed: () {},
          tooltip: 'Menu',
          iconSize: 30,
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
        )
      ],
    );
  }
}
