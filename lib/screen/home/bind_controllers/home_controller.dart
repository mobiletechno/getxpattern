
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/respository/repo.dart';
import '../../../data/respository/repo_impl.dart';
import '../models/Home_list_model.dart';

class HomeController extends GetxController {


  RxBool isLoading = false.obs;

  late Repo _Repo;
  RxList<HomeListModel> RxHomeList = RxList();
int pagination=10;
  ScrollController scrollController=ScrollController();
  @override
  onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    isLoading.toggle();
    _Repo = Get.put(RepoImpl());
    getHomeList();
  }


@override
void dispose() {
  scrollController.removeListener(_scrollListener);
  super.dispose();
}
void _scrollListener() {
  print(scrollController.position.extentAfter);


  if (scrollController.position.pixels ==
      scrollController.position.maxScrollExtent) {

  loadMore();
  }
}
 Future<void> loadMore() async {
   pagination+=10;
   var apiResult = await _Repo.getList(pagination);
   if (apiResult != null) {



     final List<dynamic> rawData = apiResult;
     RxList<HomeListModel> tempList = rawData
         .map((e) => HomeListModel.fromJson(e))
         .toList()
         .obs;
     RxHomeList.addAll(tempList);

   }

   else {
     Get.snackbar("Alert", "something went wrong",
         snackPosition: SnackPosition.BOTTOM,
         duration: Duration(seconds: 4),
         margin: EdgeInsets.all(40),
         icon: Icon(Icons.info_outline, color: Colors.white),
         colorText: Colors.white,
         backgroundColor: Colors.red);

   }
 }
  Future<void> getHomeList() async {
    var apiResult = await _Repo.getList(pagination);
    if (apiResult != null) {
      print("apiResult");
      print(apiResult.runtimeType);
      print(apiResult);
      print("apiResult");


      final List<dynamic> rawData = apiResult;
      RxHomeList = rawData
          .map((e) => HomeListModel.fromJson(e))
          .toList()
          .obs;
      isLoading.toggle();
    }

    else {
      Get.snackbar("Alert", "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(40),
          icon: Icon(Icons.info_outline, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: Colors.red);
      isLoading.toggle();
    }
  }

}
// Future<List<HomeListModel>> _IsolateparseJson(List<dynamic> args) async {
//   SendPort resultPort = args[0];
//   final List<dynamic> rawData = args[1];
//   final parsed = rawData.map((e) => HomeListModel.fromJson(e)).toList();
//   Isolate.exit(resultPort, parsed);
// }