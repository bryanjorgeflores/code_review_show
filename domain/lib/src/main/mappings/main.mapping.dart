import 'package:dio/dio.dart';
import 'package:domain/src/main/main.dart';

class MainMapping {
  List<Product> getProducts(Response response) {
    List<Product> products = [];
    for (var element in response.data) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

  Map<ProductCategory?, List<Product>> getProductsByCategory(
      Response response) {
    List<Product> products = [];
    for (var element in response.data) {
      products.add(Product.fromJson(element));
    }
    Map<ProductCategory?, List<Product>> groupedProducts = {};
    for (var product in products) {
      ProductCategory? category = product.category;
      final existingCategories = groupedProducts.keys
          .where((element) => element?.id == category?.id)
          .toList();
      if (existingCategories.isEmpty) {
        groupedProducts.addAll({
          category: products
              .where((element) => element.category?.id == category?.id)
              .toList()
        });
      }
    }
    return groupedProducts;
  }
}
