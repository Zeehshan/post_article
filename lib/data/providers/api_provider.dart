import 'package:posts_article/models/categories_model.dart';

abstract class ApiProvider {
  Future<List<CategoriesModalItem>> getCategories();
}