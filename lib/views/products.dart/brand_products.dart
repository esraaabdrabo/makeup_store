import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/view_model/brand.dart';

// ignore: must_be_immutable
class BrandProducts extends StatelessWidget {
  String brandName;
  BrandProducts(this.brandName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BrandVM(brandName),
        builder: (context, child) {
          BrandVM provider = Provider.of(context);
          List<Product> products = provider.products;
          return Scaffold(
              body: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(products[index].name),
                          Text(products[index].price),
                          Text(products[index].description),
                          Text(products[index].category),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 5,
                          ),
                        ]);
                      }));
        });
  }
}
