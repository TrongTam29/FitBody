import 'package:get/get.dart';
import 'package:my_app/model/userWorkout/userWorkout_model.dart';
import 'package:my_app/model/userWorkout/userWorkout_service.dart';

class UserWorkoutController extends GetxController {
  var isLoading = true.obs;
  // var cardioList = List<UserWorkout>.generate(100, (index) => UserWorkout()).obs;
  Rx<UserWorkout> userWorkoutObj = UserWorkout().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchWorkout(String id) async {
    try {
      isLoading(true);
      var userWorkout = await UserWorkoutService.fetchData(id);
      if (userWorkout != null) {
        userWorkoutObj.value = userWorkout;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> findWorkout(String userId) async {
    var userWorkout = await UserWorkoutService.checkUserWorkout(userId);
    return userWorkout;
  }

  void createUserWorkout(String userId) {
    UserWorkoutService.createUserWorkout(userId);
  }

  void updateWorkout(String userId, List monday, List tuesday, List wednesday,
      List thursday, List friday, List saturday) {
    UserWorkoutService.updateWorkout(
        userId, monday, tuesday, wednesday, thursday, friday, saturday);
  }

  void updateMonday(String userId, List monday) {
    UserWorkoutService.updateMonday(userId, monday);
  }

  void updateTuesday(String userId, List tuesday) {
    UserWorkoutService.updateTuesday(userId, tuesday);
  }

  void updateWednesday(String userId, List wednesday) {
    UserWorkoutService.updateWednesday(userId, wednesday);
  }

  void updateThursday(String userId, List thursday) {
    UserWorkoutService.updateThursday(userId, thursday);
  }

  void updateFriday(String userId, List friday) {
    UserWorkoutService.updateFriday(userId, friday);
  }

  void updateSaturday(String userId, List saturday) {
    UserWorkoutService.updateSaturday(userId, saturday);
  }
}
