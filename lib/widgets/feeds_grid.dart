import 'package:eccomerce_shop_app/models/products.model.dart';
import 'package:flutter/material.dart';

import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList})
      : super(key: key);
  final List<Product> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          final Product product = productsList[index];
          return FeedsWidget(product);
        });
  }
}
