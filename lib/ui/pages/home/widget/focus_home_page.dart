part of 'widgets.dart';

class HomePageDocus extends StatelessWidget {
  final List<CategoriesModalItem>? homeFocusData;
  const HomePageDocus({required this.homeFocusData});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: homeFocusData!
                .map((e) => e.posts == null
                    ? LoadingList()
                    : e.posts!.isEmpty
                        ? Container()
                        : e.id == 24
                            ? e.posts!.isEmpty
                                ? Container()
                                : CategoriesBodyHeading(
                                    e.posts![0],
                                    controller.homePost,
                                    isHome: true,
                                  )
                            : CategoriesItem(
                                news: e.posts![0],
                                blogNews: controller.homePost,
                              ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image(
                      image: new ExactAssetImage(AssetsRoutes.logo),
                      height: 60,
                      alignment: FractionalOffset.center),
                ),
                    Expanded(
                      child: Text(
                        'mentions legales qui sommes-nous ? nous contacter'.toUpperCase(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
