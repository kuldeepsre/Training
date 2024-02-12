import 'package:dreambiztech/Pojo/product.dart';
import 'package:dreambiztech/main.dart';
import 'package:dreambiztech/presentation/category_page.dart';
import 'package:dreambiztech/presentation/home_page.dart';
import 'package:dreambiztech/presentation/product_page.dart';
import 'package:dreambiztech/ui_component/HomeBody.dart';
import 'package:dreambiztech/ui_component/add_task_scrren.dart';
import 'package:dreambiztech/ui_component/task_screen.dart';

import 'package:flutter/material.dart';
import 'package:dreambiztech/presentation/cart_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case RoutePaths.categoryPage:
        return MaterialPageRoute(
            builder: (_) => CategoryPage(
                products: args as List<Product>, categoryName: args as String));
      case RoutePaths.productPage:
        return MaterialPageRoute(
            builder: (_) => ProductPage(
                product: args as Product, pageColor: args as Color));
      case RoutePaths.AddTaskScreen:
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
      case RoutePaths.TaskScreen:
        return MaterialPageRoute(builder: (_) => TaskScreen());
        case RoutePaths.HomeBody:
        return MaterialPageRoute(builder: (_) => HomeBody());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RoutePaths {
  static const String splashScreen = '/';
  static const String homePage = '/home';
  static const String categoryPage = '/category';
  static const String productPage = '/product';
  static const String cartPage = '/cart';
  static const String AddTaskScreen = '/addTask';
  static const String TaskScreen = '/taskScreen';
  static const String HomeBody = '/homeBody';
}
