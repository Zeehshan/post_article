import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/post_model.dart';

abstract class ApiProvider {
  Future<List<CategoriesModalItem>> getCategories();
  Future<List<BlogNews>> getPosts({int? categoryId,int perPage = 10});
  Future<Map<String, dynamic>?> getPageData({required int pageId});
}
