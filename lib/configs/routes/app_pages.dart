import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_article/ui/pages/home/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => Home()),
  ];
}
