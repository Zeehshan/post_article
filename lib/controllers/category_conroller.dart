import 'package:get/get.dart';
import 'package:posts_article/configs/logs.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/models.dart';
import '../data/repositories/repositories.dart';

class CategoryController extends GetxController {
  final SyncDataRepository _syncDataRepository = Get.find();
  List<CategoriesModalItem>? listCategories;

  @override
  Future<void> onInit() async {
    // sync remote data / shops
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    var list = await _syncDataRepository.getCategories();
    list[0].posts = await _syncDataRepository.getPost();
    listCategories = list;
    update();
  }

  getPost(int index) async {
    CategoriesModalItem categoriesModalItem = listCategories![index];
    if (categoriesModalItem.posts!.isEmpty) {
      _syncDataRepository.getPost();
    }
    listCategories![index].posts = [];
    update();
  }
}
