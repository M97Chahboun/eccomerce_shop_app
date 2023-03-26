import 'package:eccomerce_shop_app/widgets/rocket_error.dart';
import 'package:flutter/material.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

import '../models/products.model.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();

  int limit = 10;
  bool _isLoading = false;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // getProducts();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;
        print("_isLoading $_isLoading");
        limit += 10;
        await getProducts();
        _isLoading = false;
        print("limit $limit");
      }
    });
    super.didChangeDependencies();
  }

  final Product product = Product();

  Future<void> getProducts() async {
    Rocket.get<RocketRequest>(rocketRequestKey).request("products",
        model: product, params: {"limit": limit.toString()});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            RocketView(
                model: product,
                onError: (error, reload) {
                  return RocketErrorView(
                    reload: reload,
                    error: error,
                  );
                },
                builder: (context) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: product.all!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 0.7),
                      itemBuilder: (ctx, index) {
                        return FeedsWidget(product.all![index]);
                      });
                }),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
