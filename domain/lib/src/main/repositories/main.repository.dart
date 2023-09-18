library domain;

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainRepository {
  final MainProvider _mainProvider;
  final MainMapping _mainMapping;
  final ErrorMapping _errorMapping;
  MainRepository(this._mainProvider, this._mainMapping, this._errorMapping);

  Stream<Map<ProductCategory?, List<Product>>> getProducts() {
    return Stream.fromFuture(_mainProvider.getProducts())
        .map((response) => _mainMapping.getProductsByCategory(response))
        .handleError(_errorMapping.toThrow);
  }
}
