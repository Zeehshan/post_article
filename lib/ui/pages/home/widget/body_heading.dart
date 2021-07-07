part of 'widgets.dart';

class CategoriesBodyHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                vertical: Screen.width(context) * 0.013),
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
