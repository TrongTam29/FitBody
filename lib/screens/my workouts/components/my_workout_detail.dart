import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
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
  UserWorkoutController workoutController = Get.put(UserWorkoutController());
  late RxList<Exercise> exerciseList = RxList<Exercise>();
  @override
  void initState() {
    super.initState();
    fetchList();
  }

  void fetchList() async {
    for (var exer in widget.listWorkout) {
      var exercise = await exerciseController.findExerciseByLink(exer);
      exerciseList.add(exercise!);
    }
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
          if (exerciseController.isLoadingfindExerciseByLink.value)
            return Center(
              child: CupertinoActivityIndicator(),
            );
          else
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: exerciseList.length,
                itemBuilder: (context, index) {
                  var item = exerciseList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: size.height * 0.2 - 40,
                          width: size.width * 1,
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                            exerciseList.removeAt(index),
                            widget.listWorkout.removeAt(index),
                            if (widget.workoutDay == 'Monday')
                              {
                                workoutController.updateMonday(
                                    Get.arguments, widget.listWorkout),
                              }
                            else if (widget.workoutDay == 'Tuesday')
                              {
                                workoutController.updateTuesday(
                                    Get.arguments, widget.listWorkout),
                              }
                            else if (widget.workoutDay == 'Wednesday')
                              {
                                workoutController.updateWednesday(
                                    Get.arguments, widget.listWorkout),
                              }
                            else if (widget.workoutDay == 'Thursday')
                              {
                                workoutController.updateThursday(
                                    Get.arguments, widget.listWorkout),
                              }
                            else if (widget.workoutDay == 'Friday')
                              {
                                workoutController.updateFriday(
                                    Get.arguments, widget.listWorkout),
                              }
                            else if (widget.workoutDay == 'Saturday')
                              {
                                workoutController.updateSaturday(
                                    Get.arguments, widget.listWorkout),
                              }
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
