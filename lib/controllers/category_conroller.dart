import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_article/configs/logs.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/models.dart';
import '../data/repositories/repositories.dart';
import 'package:html/parser.dart';

class CategoryController extends GetxController with SingleGetTickerProviderMixin {
  final SyncDataRepository _syncDataRepository = Get.find();
  List<CategoriesModalItem> listCategories = [
    CategoriesModalItem(name: 'À LA UNE', id: -1, posts: []),
  ];
  List<CategoriesModalItem> listCategoriesHome = [
    CategoriesModalItem(name: 'À LA UNE', id: -1, posts: []),
  ];

   CategoriesModalItem? categoriesModalItem;

   TabController? controller;

   List<BlogNews> homePost = [];

  @override
  Future<void> onInit() async {
    // sync remote data / shops
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    var list = await _syncDataRepository.getCategories();
    printLog(':::::: getCategories ${list.length}');
    listCategories.addAll(list);
    listCategoriesHome.addAll(list);
    controller = TabController(length: listCategories.length,vsync: this);
    update();
    int count = 0;
    for (int i = count; i < listCategoriesHome.length; i++) {
      printLog('gettting post at ${listCategoriesHome[i].name}');
      if (count != 0) {
        List<BlogNews> postsList = await _syncDataRepository.getPosts(
            categoryId: listCategoriesHome[i].id, perPage: 1);
        listCategoriesHome[i].posts = postsList;
        if(postsList.isNotEmpty){
          homePost.addAll(postsList);
        }
        update();
      }
      count++;
    }
  }

  getPosts(int index, {int perPage = 10}) async {
    controller!.animateTo(index);

    if (index != 0) {
      CategoriesModalItem categoriesModalItem = listCategories[index];
      if (categoriesModalItem.posts != null) {
        if (categoriesModalItem.posts!.isEmpty) {
          List<BlogNews> postsList = await _syncDataRepository.getPosts(
              categoryId: categoriesModalItem.id, perPage: perPage);
          printLog(':::::: getPosts ${postsList.length}');
          listCategories[index].posts = postsList;
        } else if (categoriesModalItem.posts!.length <= 1) {
          List<BlogNews> postsList = await _syncDataRepository.getPosts(
              categoryId: categoriesModalItem.id, perPage: perPage);
          printLog(':::::: getPosts ${postsList.length}');
          listCategories[index].posts = postsList;
        }
      } else {
        List<BlogNews> postsList = await _syncDataRepository.getPosts(
            categoryId: categoriesModalItem.id, perPage: perPage);
        printLog(':::::: getPosts ${postsList.length}');
        listCategories[index].posts = postsList;
      }
    }
    update();
  }

  getPageData(int index, int pageId) async {
    printLog(':::::: getPageData $index $pageId');
    CategoriesModalItem categoriesModalItem = listCategories[index];
    if (categoriesModalItem.pageData == null) {
      categoriesModalItem.pageData =
          await _syncDataRepository.getPageData(pageId: pageId);
      listCategories[index].pageData = categoriesModalItem.pageData;
      update();
    }
  }
   
   //here goes the function
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
