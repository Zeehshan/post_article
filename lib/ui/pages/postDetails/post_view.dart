import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posts_article/models/post_model.dart';

class PostView extends StatelessWidget {
  final BlogNews news;
  const PostView({ Key? key, required this.news }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return [
            SliverAppBar(
              expandedHeight: 220,
              floating: true,
              pinned: true,
              snap: true,
              // actionsIconTheme: IconThemeData(opacity: 0.0),
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: CachedNetworkImage(
                      imageUrl: news.imageFeature!,
                      fit: BoxFit.cover,
                      height: 220,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 4),
                      color: Theme.of(context).secondaryHeaderColor,
                      child: Text(news.categoryName ?? '',style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontSize: 18
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  news.title ?? '',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 22
                  ),
                ),
                Text(
                  news.content ?? '',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}