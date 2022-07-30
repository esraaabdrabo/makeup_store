import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/view_model/favourite.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavouriteVM(),
        builder: (context, child) {
          FavouriteVM provider = Provider.of(context);
          print(provider.favList.length);
          return Container();
        });
  }
}
