import 'package:flutter/material.dart';
import 'package:posts_article/utils/responsive.dart';

class CategoriesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.height(context) * 0.2,
      margin: EdgeInsets.only(
        left: Screen.width(context) * 0.05,
        right: Screen.width(context) * 0.05,
        bottom: Screen.height(context) * 0.03,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
              flex: 55,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image: NetworkImage(
                          'https://filmdaily.co/wp-content/uploads/2020/05/online-basketball_lede-1300x731.jpg'),
                      fit: BoxFit.cover),
                ),
              )),
          Flexible(
            flex: 45,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue[400],
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: Screen.width(context) * 0.05,
                      vertical: Screen.width(context) * 0.008),
                  child: Text(
                    'Data',
                    style: Theme.of(context).textTheme.subtitle2?.merge(
                        TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.width(context) * 0.05,
                        vertical: Screen.width(context) * 0.008),
                    child: Text(
                      'Its a testing data just to checking UI and it is a data',
                      style: Theme.of(context).textTheme.headline6?.merge(
                            TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                          ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
