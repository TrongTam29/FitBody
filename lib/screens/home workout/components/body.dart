import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/eqiupment/equipment_screen.dart';
import 'package:my_app/screens/gym%20schedule/gym_schedule.dart';
import 'package:my_app/screens/list%20video/list_video.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        child: Column(children: <Widget>[
          GestureDetector(
            child: Image.asset(
              'assets/images/Eqiupment.png',
              width: size.width * 0.9,
              height: size.height * 0.1 + 10,
              fit: BoxFit.fill,
            ),
            onTap: () => Get.to(EquipmentScreen()),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/images/WorkoutPlan.png',
              width: size.width * 0.9,
              height: size.height * 0.1 + 10,
              fit: BoxFit.fill,
            ),
            onTap: () => Get.to(GymSchedule()),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "The muscle groups for the gym:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-SemiBold',
              ),
            ),
            alignment: Alignment(-0.75, 0),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Chest_workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Chest', idMuscle: 8)),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/ForeArm_workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Biceps', idMuscle: 9)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Shoulder_workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Shoulder', idMuscle: 10)),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/backArm_workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Triceps', idMuscle: 11)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Back_Workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Back', idMuscle: 12)),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Abs_workout.png',
                    width: size.width * 0.5 - 27,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Abs', idMuscle: 13)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Leg_workout.png',
                    width: size.width * 0.9,
                    height: size.height * 0.2 - 35,
                    fit: BoxFit.fill,
                  ),
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Leg', idMuscle: 14)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
