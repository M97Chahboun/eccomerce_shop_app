import 'dart:developer';

import 'package:eccomerce_shop_app/consts/api_consts.dart';
import 'package:eccomerce_shop_app/widgets/rocket_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

import '../models/categories_model.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  final Category category = Category();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: RocketView(
            model: category,
            onError: (error, reload) {
              return RocketErrorView(
                reload: reload,
                error: error,
              );
            },
            onLoading :()=> const Center(
            child: CircularProgressIndicator(),
          ),
            call: () {
              Rocket.get<RocketClient>(rocketRequestKey).request(
                "categories",
                model: category,
                inspect: (data) {
                  log(data.toString());
                  return data;
                },
              );
            },
            builder: (context, state) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (ctx, index) {
                    print(category.all);
                    Rocket.add(key: rocketCategoriesKey, category.all![index]);
                    return const CategoryWidget();
                  });
            }));
  }
}
