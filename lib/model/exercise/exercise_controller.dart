import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/exercise/exercise.dart';

import 'remote_services.dart';

class ExerciseController extends GetxController {
  CollectionReference _exerciseCollection =
      FirebaseFirestore.instance.collection("Exercise");
  RxList<Exercise> exerciseList = RxList<Exercise>([]);
  final exerciseObj = Exercise().obs;

  void getExercises(int id) {
    exerciseList.bindStream(_exerciseCollection
        .where('muscle_group_id', isEqualTo: 1)
        .snapshots()
        .map((query) => query.docs.map((e) => Exercise.fromJson(e)).toList()));
  }

  void postExercise(String name, String link, String image, String reps,
      String sets, String exerciseBreak, String detail, int muscleGroupId) {
    ExerciseService.postExercise(
        name, link, image, reps, sets, exerciseBreak, detail, muscleGroupId);
  }

  Future<Exercise?> findExerciseByLink(String link) async {
    var exercise = await ExerciseService.findExercise(link);
    if (exercise != null) {
      return exercise;
    }
  }
}
