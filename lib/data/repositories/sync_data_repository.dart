
import 'package:get/get.dart';
import 'package:posts_article/data/providers/api_provider.dart';

class SyncDataRepository {
  final ApiProvider _apiProvider = Get.find();
  Future<List<dynamic>> getCategories() async{
     return _apiProvider.getCategories();
  } 
}