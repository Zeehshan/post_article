import 'package:flutter/material.dart';
import 'package:posts_article/utils/responsive.dart';

class CategoriesItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.height(context) * 0.055,
      color: Colors.red[600],
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: Screen.width(context) * 0.05),
              child: Text(
                'Header',
                style: Theme.of(context).textTheme.headline6?.merge(TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.white)),
              ));
        },
      ),
    );
  }
}
