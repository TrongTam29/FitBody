import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/equipment/equipment_model.dart';
import 'equipment_service.dart';

class EquipmentController extends GetxController {
  var isLoading = true.obs;
  var equipmentList = List<Equipment>.generate(100, (index) => Equipment()).obs;
  // List<equipment> equipmentList = [];

  @override
  void onInit() {
    fetchEquipment();
    super.onInit();
  }

  void fetchEquipment() async {
    try {
      isLoading(true);
      var equipments = await Services.fetchData();
      if (equipments != null) {
        equipmentList.value = equipments;
      }
    } finally {
      isLoading(false);
    }
  }
}
