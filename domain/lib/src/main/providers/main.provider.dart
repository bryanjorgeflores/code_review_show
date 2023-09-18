import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainProvider {
  final ApiProvider _apiProvider;
  MainProvider(this._apiProvider);

  Future<Response> getProducts() async {
    return _apiProvider.get('/products');
  }
}
