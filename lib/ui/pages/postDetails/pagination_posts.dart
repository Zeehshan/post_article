import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:posts_article/models/post_model.dart';
import 'package:posts_article/ui/pages/postDetails/post_view.dart';

class SwipePaginationPosts extends StatefulWidget {
  final List<BlogNews> posts;
  final int index;
  const SwipePaginationPosts({Key? key, required this.posts, required this.index}) : super(key: key);

  @override
  _SwipePaginationPostsState createState() => _SwipePaginationPostsState();
}

class _SwipePaginationPostsState extends State<SwipePaginationPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        index: widget.index,
        onIndexChanged: (index){

        },
          pagination: SwiperPagination(
            alignment: Alignment.topCenter
          ),
          itemCount: widget.posts.length,
          itemBuilder: (BuildContext context, int index){
            return PostView(news: widget.posts[index]);
          },
          ),
    );
  }
}
