import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/cardio/cardio_model.dart';
import 'package:my_app/model/cardio/cardio_service.dart';

class CardioController extends GetxController {
  var isLoading = true.obs;
  var isLoadingfindCardioByLink = true.obs;
  var cardioList = List<Cardio>.generate(100, (index) => Cardio()).obs;
  // List<Exercise> exerciseList = [];

  @override
  void onInit() {
    super.onInit();
    fetchCardio();
  }

  void fetchCardio() async {
    try {
      isLoading(true);
      var cardios = await CardioService.fetchData();
      if (cardios != null) {
        cardioList.value = cardios;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Cardio?> findCardioByLink(String link) async {
    try {
      isLoadingfindCardioByLink(true);
      var cardio = await CardioService.findCardio(link);
      if (cardio != null) {
        return cardio;
      }
    } finally {
      isLoadingfindCardioByLink(false);
    }
  }
}
