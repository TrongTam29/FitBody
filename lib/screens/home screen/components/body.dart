import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/home%20screen/components/header_with_seachbox.dart';
import 'package:my_app/screens/home%20workout/home_workout.dart';
import 'package:my_app/screens/list%20cardio/list_cardio.dart';
import 'package:my_app/screens/my%20workouts/my_workout.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderAndSearchbox(),
          MethodsInBody(),
        ],
      ),
    );
  }
}

class MethodsInBody extends StatefulWidget {
  MethodsInBody({Key? key}) : super(key: key);

  @override
  _MethodsInBodyState createState() => _MethodsInBodyState();
}

class _MethodsInBodyState extends State<MethodsInBody> {
  UserWorkoutController workoutController = Get.put(UserWorkoutController());
  UserController userController = Get.find();
  User? user = FirebaseAuth.instance.currentUser;
  late String userEmail = user?.email ?? 'username';
  @override
  void initState() {
    super.initState();
    userController.findUser(userEmail, onDone: () {
      workoutController.getUserWorkouts(userController.userObj.value.id ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Image.asset(
              'assets/images/GymGuide.png',
              width: 360,
              height: 195,
              fit: BoxFit.fill,
            ),
            onTap: () => Get.to(GymGuide()),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/HomeWorkout.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(HomeWorkout()),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/nutrition.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(NutritionScreen()),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    child: Image.asset(
                      'assets/images/MyWorkout.png',
                      width: 170,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                    onTap: () => {
                          if (userEmail == 'username')
                            {
                              Get.defaultDialog(
                                  title: 'Notification',
                                  titleStyle: TextStyle(
                                    fontSize: 22,
                                    color: kPrimaryColor,
                                    fontFamily: 'Wellfleet',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  content: Column(
                                    children: [
                                      Text(
                                          "You need to Login to use this function. Sorry for this inconvenience"),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => HelloScreen());
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 25)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xE68F839C)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  side: BorderSide(
                                                      color: Colors.white))),
                                        ),
                                      ),
                                    ],
                                  )),
                            }
                          else
                            Get.to(() => MyWorkout()),
                        }),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/cardio.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(ListCardio()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
