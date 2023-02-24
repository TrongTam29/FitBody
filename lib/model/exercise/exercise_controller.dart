import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/exercise/exercise.dart';

import 'remote_services.dart';

class ExerciseController extends GetxController {
  var isLoading = true.obs;
  var isLoadingfindExerciseByLink = true.obs;
  var exerciseList = List<Exercise>.generate(100, (index) => Exercise()).obs;
  final exerciseObj = Exercise().obs;

  void fetchExercise(int id) async {
    try {
      isLoading(true);
      var exercises = await ExerciseService.fetchData(id);
      if (exercises != null) {
        exerciseList.value = exercises;
      }
    } finally {
      isLoading(false);
    }
  }

  void postExercise(String name, String link, String image, String reps,
      String sets, String exerciseBreak, String detail, int muscleGroupId) {
    ExerciseService.postExercise(
        name, link, image, reps, sets, exerciseBreak, detail, muscleGroupId);
  }

  Future<Exercise?> findExerciseByLink(String link) async {
    try {
      isLoadingfindExerciseByLink(true);
      var exercise = await ExerciseService.findExercise(link);
      if (exercise != null) {
        return exercise;
      }
    } finally {
      isLoadingfindExerciseByLink(false);
    }
  }
}
