import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:posts_article/configs/routes/assets_routes.dart';
import 'package:posts_article/ui/widget/loading.dart';
import '../../../controllers/controllers.dart';
import '../../widget/app_bar.dart';
import '../../../utils/responsive.dart';
import 'widget/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            centerTitle: true,
            backwardsCompatibility: false,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.white),
            title: Image(
                image: new ExactAssetImage(AssetsRoutes.logo),
                height: 40,
                alignment: FractionalOffset.center),
            toolbarHeight: 80,
          ),
          body: body(context),
          drawer: GetBuilder<CategoryController>(builder: (controller) {
            if (controller.listCategories.length == 1) {
              return Container();
            }
            return Drawer(
              child: Container(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.separated(
                          itemBuilder: (context, index) {
                            var e = controller.listCategories[index];
                            return Container(
                            width: double.infinity,
                              child: TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                  controller.getPosts(index);
                                },
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(e.name,style: Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey
                                    ),),
                                  ),
                                )),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(left: 80),
                              child: Divider(
                                height: 0,
                              ),
                            );
                          },
                          itemCount: controller.listCategories.length),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget body(context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          if (controller.listCategories.isEmpty)
            return Center(child: Text('Nothing found'));
          return controller.listCategories.length == 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
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
                        color: Theme.of(context).primaryColor,
                        child: TabBar(
                          controller: controller.controller,
                          onTap: (int i) {
                            setState(() {
                              print('here index $i');
                              index = i;
                            });
                            controller.getPosts(index);
                          },
                          labelPadding: EdgeInsets.only(
                              left: 10, right: 10, top: 8, bottom: 5),
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: Colors.white,
                          tabs: controller.listCategories
                              .asMap()
                              .entries
                              .map((category) => Categorie(
                                    item: category.value,
                                    color: Colors.white,
                                  ))
                              .toList(),
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                            controller: controller.controller,
                        physics: NeverScrollableScrollPhysics(),
                        children: controller.listCategories
                            .map((category) => category.id == -1
                                ? HomePageDocus(
                                    homeFocusData:
                                        controller.listCategoriesHome,
                                  )
                                : category.posts == null
                                    ? ListView(
                                        children: List.generate(
                                            5, (index) => LoadingList()),
                                      )
                                    : category.posts!.isEmpty
                                        ? Container(
                                            child: Center(
                                              child: Text('Empty'),
                                            ),
                                          )
                                        : ListView(
                                            children: List.generate(
                                                category.posts!.length,
                                                (index) => index == 0
                                                    ? CategoriesBodyHeading(
                                                        category
                                                            .posts![index],category.posts!)
                                                    : CategoriesItem(
                                                        news: category
                                                            .posts![index],
                                                            blogNews: category.posts!,
                                                            ))))
                            .toList(),
                      )),
                    ],
                  ),
                );
        });
  }
}
