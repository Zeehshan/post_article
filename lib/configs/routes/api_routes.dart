import 'package:posts_article/configs/app_environment.dart';

final String apiVersion = "wp-json/wp/v2/";

enum ApisRoutes {
  CATEGORIES,
}

apisToUrls(ApisRoutes endpoint) {
  switch (endpoint) {
    case ApisRoutes.CATEGORIES:
      return AppEnvironment.apiBaseUrl +
          apiVersion +
          'categories?_embed?page=1&per_page=20';
  }
}
