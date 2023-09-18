import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/containers/commons/not_found/not_found_page.dart';
import 'package:presentation/containers/main/main_page.dart';
import 'package:presentation/containers/main/product_details/product_details_page.dart';

class Routes {
  static String main = "/main";
  static String productDetails = "/product-details";

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {
      main: (context) {
        Object? arguments = getContextArguments(context);
        String? url = arguments as String?;
        return MainPage(url: url);
      },
      productDetails: (context) {
        Object? arguments = getContextArguments(context);
        Product? product = arguments as Product?;
        return ProductDetailsPage(product: product,);
      },
    };
  }

  static Route<dynamic>? Function(RouteSettings)? generateNotFoundRoute() {
    return (context) {
      return MaterialPageRoute(
        builder: (context) => const NotFoundPage(),
      );
    };
  }

  static getContextArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments;
  }
}
