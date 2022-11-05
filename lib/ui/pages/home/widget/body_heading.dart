part of 'widgets.dart';

class CategoriesBodyHeading extends StatelessWidget {
  final BlogNews? news;
  final List<BlogNews> blogNews;
  final bool isHome;
  const CategoriesBodyHeading(this.news,this.blogNews,{this.isHome = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: news!.imageFeature!,
                fit: BoxFit.fitWidth,
              ),
              Container(
                color: new Color.fromRGBO(0, 0, 0, .7),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: Screen.width(context) * 0.05,
                    vertical: Screen.width(context) * 0.013),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news!.categoryName ?? '',
                      style: Theme.of(context).textTheme.subtitle2?.merge(
                          TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800)),
                    ),
                    Text(
                      news!.title ?? '',
                      style: Theme.of(context).textTheme.headline6?.merge(
                          TextStyle(
                              color: Colors.white,
                              fontSize: Screen.getSize(context, 1.95),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Positioned.fill(child: InkWell(
                onTap: (){
                  int index = blogNews.indexOf(news!);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SwipePaginationPosts(index: index,posts: blogNews,)));
                },
              ))
            ],
          ),
        ),
        if(isHome)
        Container(
          height: 90,
          padding: EdgeInsets.only(bottom: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Contribuez a BeBasket',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontSize: 16
                      ),
                ),
              ),
              Positioned(
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Text.rich(TextSpan(
                      text: 'A partir\n',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontSize: 16
                          ),
                      children: [
                        TextSpan(
                          text: 'de '
                        ),
                        TextSpan(
                            text: '5€',
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.white,
                                      fontSize: 18
                                    )),
                                    TextSpan(
                                      text: '!',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontSize: 16
                          )
                                    )
                      ])),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
