import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posts_article/configs/routes/assets_routes.dart';

class Header {
  static appBar() {
    return AppBar(
      centerTitle: true,
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      title: Image(
          image: new ExactAssetImage(AssetsRoutes.logo),
          height: 60,
          alignment: FractionalOffset.center),
      leading: Icon(
        Icons.menu,
        color: Colors.red,
        size: 30,
      ),
      toolbarHeight: 80,
    );
  }
}
