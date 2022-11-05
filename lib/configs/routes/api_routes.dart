import 'package:posts_article/configs/app_environment.dart';

final String apiVersion = "wp-json/wp/v2/";

enum ApisRoutes { CATEGORIES, POSTS, PAGE_DATA }

apisToUrls(ApisRoutes endpoint,{int? categoryId, int? pageId, int perPage = 10}) {
  switch (endpoint) {
    case ApisRoutes.CATEGORIES:
      return AppEnvironment.apiBaseUrl +
          apiVersion +
          'categories?_embed?page=1&per_page=100';
    case ApisRoutes.POSTS:
      return AppEnvironment.apiBaseUrl +
          apiVersion +
          'posts/?categories=$categoryId&_embed&page=1&per_page=$perPage';
    case ApisRoutes.PAGE_DATA:
      return AppEnvironment.apiBaseUrl + 'wp-json/wp/v2/pages/$pageId?_embed';
  }
}
