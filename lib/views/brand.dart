import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Brand extends StatelessWidget {
  String brandName;
  Brand(this.brandName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(brandName)),
    );
  }
}
