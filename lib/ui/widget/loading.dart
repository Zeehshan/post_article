import 'package:flutter/material.dart';
import 'package:posts_article/ui/widget/shimmer.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.1),
        highlightColor: Colors.grey.withOpacity(.2),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          height: 200,
          color: Colors.black,
        ),
      ),
    );
  }
}
