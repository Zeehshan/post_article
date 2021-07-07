part of 'widgets.dart';

class Categorie extends StatelessWidget {
  final CategoriesModalItem item;

  const Categorie({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: Screen.width(context) * 0.05),
        child: Text(
          item.name,
          style: Theme.of(context).textTheme.headline6?.merge(
              TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
        ));
  }
}
