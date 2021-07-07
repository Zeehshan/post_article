import 'package:get/get.dart';
import 'package:posts_article/data/providers/api_provider.dart';
import 'package:posts_article/models/categories_model.dart';

class SyncDataRepository {
  final ApiProvider _apiProvider = Get.find();
  Future<List<CategoriesModalItem>> getCategories() async {
    return _apiProvider.getCategories();
  }
}
