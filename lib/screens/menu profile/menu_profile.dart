import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/login/FbLogin_controller.dart';
import 'package:my_app/login/GgLogin_controller.dart';
import 'package:my_app/screens/alarm/alarm_view.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/home%20screen/home_main.dart';

class MenuProfile extends StatefulWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  _MenuProfileState createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile> {
  @override
  Widget build(BuildContext context) {
    GgLoginController ggController = Get.put(GgLoginController());
    FbLoginController fbController = Get.put(FbLoginController());
    User? user = FirebaseAuth.instance.currentUser;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF5E96AE),
      body: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user?.photoURL ??
                          'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                    ),
                    title: Text(
                      user?.displayName ?? 'Trainer',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(user?.email ?? 'User@gmail.com'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'BMI: \t\t\t ',
                      ),
                      Text('Height:   Kg'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => HomeSreen());
                  },
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => AlarmPage());
                  },
                  leading: Icon(
                    Icons.alarm,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Alarm',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.build,
                    color: Colors.black,
                  ),
                  title: Text(
                    'BMI tool',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4 - 20,
                ),
                ListTile(
                  onTap: () {
                    fbController.logOut();
                    ggController.logoutGoogle();
                    ggController.logOut();
                    Get.to(() => HelloScreen());
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
