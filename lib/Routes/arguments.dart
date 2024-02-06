import 'dart:ui';

import 'package:dreambiztech/Pojo/product.dart';

class Arguments {
  final Color pageColor;
  final List<Product> products;
  final String categoryName;
  final Product product;

  Arguments(this.pageColor, this.products, this.categoryName, this.product);
}