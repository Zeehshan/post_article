import 'package:get/get.dart';
import 'package:posts_article/data/providers/api_provider.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/models.dart';

class SyncDataRepository {
  final ApiProvider _apiProvider = Get.find();
  Future<List<CategoriesModalItem>> getCategories() async {
    return _apiProvider.getCategories();
  }

  Future<List<BlogNews>> getPost() async {
    return _apiProvider.getPost();
  }
}
