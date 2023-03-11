import 'package:flutter/material.dart';
import 'package:pokemon_app/module/home_module/model/home_model.dart';
import 'package:pokemon_app/util/helper/api_base_helper.dart';

class ApiProvider {
  final apiBaseHelper = ApiBaseHelper();
  List<HomeModel> listHomeData = [];
  Future<List<HomeModel>> fetchHomeList() async {
    try {
      await apiBaseHelper
          .onNetworkRequesting(methode: METHODE.get, isAuthorize: false)
          .then((respone) async {
        respone.map((data) {
          listHomeData.add(HomeModel.fromJson(data));
          // debugPrint("======data=====>>> $data");
        }).toList();
      }).onError((ErrorModel errorModel, stackTrace) {
        debugPrint("======1=====>>> ${errorModel.statusCode}");
        debugPrint("======2=====>>> ${errorModel.bodyString}");
      });
    } catch (e) {
      debugPrint("====3===> Error$e");
    }
    return listHomeData;
  }

  Future<List<HomeModel>> searchData() async {
    List<HomeModel> listHomeData = [];
    try {
      await apiBaseHelper
          .onNetworkRequesting(methode: METHODE.get, isAuthorize: false)
          .then((respone) async {
        respone.map((data) {
          listHomeData.add(HomeModel.fromJson(data));
          // debugPrint("======data=====>>> $data");
        }).toList();
      }).onError((ErrorModel errorModel, stackTrace) {
        debugPrint("======1=====>>> ${errorModel.statusCode}");
        debugPrint("======2=====>>> ${errorModel.bodyString}");
      });
    } catch (e) {
      debugPrint("====3===> Error$e");
    }
    return listHomeData;
  }
}
