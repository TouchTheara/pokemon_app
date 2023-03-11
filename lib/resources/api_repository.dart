import 'package:pokemon_app/module/home_module/model/home_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<HomeModel>> fetchHomeList() {
    return _provider.fetchHomeList();
  }

  Future<List<HomeModel>> fetchSeachList() {
    return _provider.searchData();
  }
}

class NetworkError extends Error {}
