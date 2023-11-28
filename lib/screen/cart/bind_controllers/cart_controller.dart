
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/respository/repo.dart';
import '../../../data/respository/repo_impl.dart';
import '../../home/models/Home_list_model.dart';


class CartController extends GetxController {


  RxBool isLoading = false.obs;

  late Repo _Repo;
  RxList<HomeListModel> RxHomeList = RxList();

  @override
  onInit() {
    super.onInit();
    isLoading.toggle();
    _Repo = Get.put(RepoImpl());
    getHomeList();
  }


  Future<void> getHomeList() async {
    var apiResult = await _Repo.getList(1);
    if (apiResult != null) {


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
