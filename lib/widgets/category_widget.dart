import 'package:eccomerce_shop_app/consts/api_consts.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

import '../consts/global_colors.dart';
import '../models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoriesModelProvider = Rocket.get<Category>(rocketCategoriesKey);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: categoriesModelProvider.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              categoriesModelProvider.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: lightCardColor.withOpacity(0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
