import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/post_model.dart';

abstract class ApiProvider {
  Future<List<CategoriesModalItem>> getCategories();
  Future<List<BlogNews>> getPost();
}
