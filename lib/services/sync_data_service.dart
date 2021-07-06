import 'package:get/get.dart';
import 'package:posts_article/models/categories_model.dart';
import '../data/repositories/repositories.dart';

class SyncDataService extends GetxController {
  final SyncDataRepository _syncDataRepository = Get.find();
  List<CategoriesModalItem>? listCategories;

  @override
  Future<void> onInit() async {
    // sync remote data / shops
    super.onInit();
    _syncDataRepository.getCategories();
  }

  Future<void> getCategories() async {
    List<CategoriesModalItem> listShops = [];
    var list = await _syncDataRepository.getCategories();
    if (list.isNotEmpty) {
      list.forEach((element) {
        listShops.addAll(element.shopModel);
      });
    }
    print(listShops);
    listCategories = listShops;
    update();
  }
}
