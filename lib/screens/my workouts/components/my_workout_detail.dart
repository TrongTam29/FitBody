import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';

class MyWorkoutDetail extends StatefulWidget {
  const MyWorkoutDetail({required this.listWorkout, required this.workoutDay});

  final List<String> listWorkout;
  final String workoutDay;
  @override
  _MyWorkoutDetailState createState() => _MyWorkoutDetailState();
}

class _MyWorkoutDetailState extends State<MyWorkoutDetail> {
  final ExerciseController exerciseController = Get.put(ExerciseController());
  UserWorkoutController workoutController = Get.find();
  UserController userController = Get.find();
  @override
  void initState() {
    super.initState();
    exerciseController.getExercisesByLink(widget.listWorkout);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: widget.workoutDay,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return exerciseController.userWorkoutList.isEmpty
              ? Container(
                  child: Center(
                    child: Text('No data yet'),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListView.builder(
                    itemCount: exerciseController.userWorkoutList.length,
                    itemBuilder: (context, index) {
                      var item = exerciseController.userWorkoutList[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: size.height * 0.2 - 40,
                              width: size.width * 1,
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  item.image!,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            onTap: () => Get.to(DetailVideo(
                              id: item.id!,
                              url: item.link!,
                              nameExercise: item.name!,
                              reps: item.reps!,
                              sets: item.sets!,
                              breaks: item.exerciseBreak.toString(),
                              detail: item.detail.toString(),
                            )),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 25,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey[100],
                              ),
                              child: Text(
                                item.name!,
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 16,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            top: 15,
                            child: GestureDetector(
                              onTap: () => {
                                exerciseController.userWorkoutList
                                    .removeAt(index),
                                widget.listWorkout.removeAt(index),
                                workoutController.updateDayWorkout(
                                    workoutController.userWorkoutObj.value.id ??
                                        '',
                                    widget.workoutDay.toLowerCase(),
                                    widget.listWorkout),
                              },
                              child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey[100],
                                ),
                                child: Icon(
                                  Icons.delete_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
