import 'package:get/get.dart';
import '../data/repositories/repositories.dart';

class SyncDataService extends GetxController {
    final SyncDataRepository _syncDataRepository = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

    Future<void> getCategories() async {
      
    }
}