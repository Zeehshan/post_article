import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:posts_article/ui/widget/app_bar.dart';
import 'package:posts_article/utils/responsive.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: Header.appBar(),
          body: body(context),
        ),
      ),
    );
  }

  Widget body(context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
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
                      padding:
                          EdgeInsets.only(left: Screen.width(context) * 0.05),
                      child: Text(
                        'Header',
                        style: Theme.of(context).textTheme.headline6?.merge(
                            TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                      ));
                },
              ),
            ),
            bodyHeading(context),
            SizedBox(height: Screen.height(context) * 0.008),
            Stack(alignment: Alignment.center, children: <Widget>[
              Container(
                height: Screen.height(context) * 0.08,
                color: Colors.red[600],
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: Screen.width(context) * 0.05),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: Screen.height(context) * 0.08,
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(left: Screen.width(context) * 0.05),
                    width: Screen.width(context) * 0.7,
                    child: Text(
                      'Contribute in basketball',
                      style: Theme.of(context).textTheme.headline6?.merge(
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    height: Screen.height(context) * 0.095,
                    color: Colors.blue[400],
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.width(context) * 0.02),
                    width: Screen.width(context) * 0.25,
                    child: Text(
                      'A Partir de 5 Euro',
                      style: Theme.of(context).textTheme.headline6?.merge(
                          TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: Screen.getSize(context, 1.8),
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: Screen.width(context) * 0.05,
                  )
                ],
              ),
            ]),
            SizedBox(height: Screen.height(context) * 0.04),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
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
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.merge(TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.merge(
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
              },
            ),
            bodyHeading(context),
            SizedBox(height: Screen.height(context) * 0.04),
          ],
        ),
      ),
    );
  }

  Widget bodyHeading(context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: Screen.height(context) * 0.35,
            child: Image.network(
              'https://filmdaily.co/wp-content/uploads/2020/05/online-basketball_lede-1300x731.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: new Color.fromRGBO(0, 0, 0, .7),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: Screen.width(context) * 0.05,
                vertical: Screen.width(context) * 0.008),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '[PODCOST]',
                  style: Theme.of(context).textTheme.subtitle2?.merge(TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w800)),
                ),
                Text(
                  'The Football match is going on and its goinf to be goof',
                  style: Theme.of(context).textTheme.headline6?.merge(TextStyle(
                      color: Colors.white,
                      fontSize: Screen.getSize(context, 1.95),
                      fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
