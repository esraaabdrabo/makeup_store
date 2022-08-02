import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/view_model/shopping_cart.dart';
import 'package:store/views/brands.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShoppingCartVM(),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Brands(),
          );
        });
  }
}
