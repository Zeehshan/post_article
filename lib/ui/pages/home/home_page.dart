import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../controllers/controllers.dart';
import '../../../models/categories_model.dart';
import '../../widget/app_bar.dart';
import '../../../utils/responsive.dart';
import 'widget/widgets.dart';

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
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          if (controller.listCategories == null)
            return Center(child: Container());
          if (controller.listCategories!.isEmpty)
            return Center(child: Text('Nothing found'));
          return DefaultTabController(
            length: controller.listCategories!.length,
            child: Container(
              child: Column(
                children: <Widget>[
                  // Container(
                  //     height: Screen.height(context) * 0.055,
                  //     color: Colors.red[600],
                  //     alignment: Alignment.centerLeft,
                  //     child: ListView.builder(
                  //         primary: false,
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: CategoriesModal.items!.length,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Categorie(
                  //               item: CategoriesModal.items![index]);
                  //         })),
                  Container(
                    color: Colors.red[600],
                    child: TabBar(
                      onTap: (int index){
                        
                      },
                      labelPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 14, bottom: 7),
                      isScrollable: true,
                      indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                      tabs: controller.listCategories!
                          .map((category) => Categorie(item: category))
                          .toList(),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    children: controller.listCategories!
                        .map((e) => ListView(
                              children: e.posts!
                                  .map((e) => Column(
                                        children: [
                                          //     Container(
                                          //                   width: double.infinity,
                                          //                   color: Colors.red[600],
                                          //                   child: SingleChildScrollView(
                                          // scrollDirection: Axis.horizontal,
                                          // child: Row(
                                          //   children: controller.listCategories!.map((category) => Categorie(item: category)).toList(),
                                          // ),
                                          //                   ),
                                          //                 ),
                                          CategoriesBodyHeading(),
                                          SizedBox(
                                              height: Screen.height(context) *
                                                  0.008),
                                          Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height:
                                                      Screen.height(context) *
                                                          0.08,
                                                  color: Colors.red[600],
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: EdgeInsets.only(
                                                      left: Screen.width(
                                                              context) *
                                                          0.05),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height: Screen.height(
                                                              context) *
                                                          0.08,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.only(
                                                          left: Screen.width(
                                                                  context) *
                                                              0.05),
                                                      width: Screen.width(
                                                              context) *
                                                          0.7,
                                                      child: Text(
                                                        'Contribute in basketball',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            ?.merge(TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: Screen.height(
                                                              context) *
                                                          0.095,
                                                      color: Colors.blue[400],
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              Screen.width(
                                                                      context) *
                                                                  0.02),
                                                      width: Screen.width(
                                                              context) *
                                                          0.25,
                                                      child: Text(
                                                        'A Partir de 5 Euro',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            ?.merge(TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: Screen
                                                                    .getSize(
                                                                        context,
                                                                        1.8),
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Screen.width(
                                                              context) *
                                                          0.05,
                                                    )
                                                  ],
                                                ),
                                              ]),
                                          SizedBox(
                                              height: Screen.height(context) *
                                                  0.04),
                                          ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: 20,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CategoriesItem();
                                            },
                                          ),
                                          CategoriesBodyHeading(),
                                          SizedBox(
                                              height: Screen.height(context) *
                                                  0.04),
                                        ],
                                      ))
                                  .toList(),
                            ))
                        .toList(),
                  )),
                ],
              ),
            ),
          );
        });
  }
}
