import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_service.dart';

class ExerciseCommentController extends GetxController {
  var isLoading = true.obs;
  var exerciseCommentList =
      List<ExerciseComment>.generate(100, (index) => ExerciseComment()).obs;
  final exerciseObj = Exercise().obs;

  Future<List<ExerciseComment>?> fetchExerciseComment(int exerciseId) async {
    try {
      isLoading(true);
      var exercises = await ExerciseCommentService.fetchListComment(exerciseId);
      if (exercises != null) {
        exerciseCommentList.value = exercises;
      }
      return exerciseCommentList;
    } finally {
      isLoading(false);
    }
  }
}
