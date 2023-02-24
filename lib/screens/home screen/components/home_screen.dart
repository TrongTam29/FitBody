import 'package:flutter/material.dart';
import 'package:my_app/screens/home%20screen/components/body.dart';

class Home extends StatelessWidget {
  final VoidCallback openDrawer;

  const Home({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: DrawerMenuWidget(
          onClicked: openDrawer,
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            'Fit Body',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              fontFamily: 'AdventPro',
            ),
          ),
        ),
        actions: null,
      ),
      body: Body(),
    );
  }
}

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_horiz_outlined),
      onPressed: onClicked,
      tooltip: 'Menu',
      iconSize: 30,
    );
  }
}
