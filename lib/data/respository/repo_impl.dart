import 'dart:async';

import 'dart:convert' as convert;


import 'package:get/get.dart';
import 'package:getxpattern/data/respository/repo.dart';
import '../../app_config/app_constant.dart';
import '../webservice/http_service.dart';
import '../webservice/http_service_impl.dart';
class RepoImpl implements Repo {

  HttpService _httpService = Get.put(HttpServiceImplementation());
  RepoImpl() {
    this._httpService.init();
  }

  @override
  Future<dynamic> getList(int pagination) async {
    try {
      final response = await _httpService.getRequest(
          "${AppConstant.BASEURL}${AppConstant.LIST_API}$pagination&context=embed");


      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body);
        return jsonResponse;
      }
    } on Exception catch (e) {}
  }
}
