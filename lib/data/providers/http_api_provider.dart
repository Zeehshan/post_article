import 'package:posts_article/configs/routes/api_routes.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/utils/k3webservice.dart';

import 'api_provider.dart';

class HttpApiProvider implements ApiProvider {
  @override
  Future<List<CategoriesModalItem>> getCategories() async {
    final List<CategoriesModalItem>? apiResponse =
        await K3Webservice.getMethod<List<CategoriesModalItem>>(
            url: apisToUrls(ApisRoutes.CATEGORIES));
    if (apiResponse != null) {
      return apiResponse as List<CategoriesModalItem>;
    } else {
      return [];
    }
  }
}
