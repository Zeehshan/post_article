import 'package:posts_article/configs/routes/api_routes.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/post_model.dart';
import 'package:posts_article/utils/k3webservice.dart';

import 'api_provider.dart';

class HttpApiProvider implements ApiProvider {
  @override
  Future<List<CategoriesModalItem>> getCategories() async {
    final List<CategoriesModalItem>? apiResponse =
        await K3Webservice.getMethod<List<CategoriesModalItem>>(
            url: apisToUrls(ApisRoutes.CATEGORIES));
    if (apiResponse != null) {
      return apiResponse;
    } else {
      return [];
    }
  }

  @override
  Future<List<BlogNews>> getPosts({int? categoryId, int perPage = 10}) async {
    final List<BlogNews>? apiResponse =
        await K3Webservice.getMethod<List<BlogNews>>(
            url: apisToUrls(ApisRoutes.POSTS,perPage: perPage,categoryId: categoryId));
    if (apiResponse != null) {
      return apiResponse;
    } else {
      return [];
    }
  }

  @override
  Future<Map<String, dynamic>?> getPageData({required int pageId}) async {
    final Map<String, dynamic>? apiResponse =
        await K3Webservice.getMethod<Map<String, dynamic>>(
            url: apisToUrls(ApisRoutes.PAGE_DATA, pageId: pageId));
    if (apiResponse != null) {
      return apiResponse;
    } else {
      return null;
    }
  }
}
