import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/view_model/category.dart';

// ignore: must_be_immutable
class Categroy extends StatelessWidget {
  String categoryName;
  Categroy(this.categoryName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryVM(categoryName),
        builder: (context, child) {
          CategoryVM provider = Provider.of(context);
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
