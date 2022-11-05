part of 'widgets.dart';

class CategoriesItem extends StatelessWidget {
  final BlogNews news;
  final List<BlogNews>? blogNews;
  const CategoriesItem({Key? key, required this.news, required this.blogNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.height(context) * 0.2,
      margin: EdgeInsets.only(
        left: Screen.width(context) * 0.05,
        right: Screen.width(context) * 0.05,
        bottom: Screen.height(context) * 0.03,
      ),
      child: InkWell(
        onTap: () {
          int index = blogNews!.indexOf(news);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SwipePaginationPosts(
                        index: index,
                        posts: blogNews!,
                      )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 55,
              child: CachedNetworkImage(
                imageUrl: news.imageFeature!,
                fit: BoxFit.fitWidth,
              ),
            ),
            Flexible(
              flex: 45,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.width(context) * 0.05,
                        vertical: Screen.width(context) * 0.008),
                    child: Text(
                      news.categoryName ?? '',
                      style: Theme.of(context).textTheme.subtitle2?.merge(
                          TextStyle(
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
                        news.title ?? '',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
