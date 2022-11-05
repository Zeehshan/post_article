import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:posts_article/configs/logs.dart';
import 'package:posts_article/configs/routes/assets_routes.dart';
import 'package:posts_article/controllers/controllers.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/models.dart';
import 'package:posts_article/ui/pages/postDetails/pagination_posts.dart';
import 'package:posts_article/ui/pages/postDetails/post_view.dart';
import 'package:posts_article/ui/widget/loading.dart';
import 'package:posts_article/utils/responsive.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'categorie.dart';
part 'categories_item.dart';

part 'body_heading.dart';

part 'posts.dart';

part 'focus_home_page.dart';