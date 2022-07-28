import 'package:flutter/material.dart';
import 'package:store/view_model/home.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> brands = HomeVM.brands;
    List<String> categories = HomeVM.categories;
    text(List<String> list) {
      for (int i = 0; i < brands.length - 1; i++) {
        return Text(brands[i]);
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text('brands'),
        const Divider(
          thickness: 3,
          endIndent: 150,
          indent: 150,
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0, crossAxisSpacing: 0, crossAxisCount: 3),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return TextButton(onPressed: () {}, child: Text(brands[index]));
            },
          ),
        ),
        const Divider(
          thickness: 15,
        ),
        const SizedBox(
          height: 100,
        ),
        const Text('categories'),
        const Divider(
          thickness: 3,
          endIndent: 150,
          indent: 150,
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return TextButton(
                  onPressed: () {}, child: Text(categories[index]));
            },
          ),
        )
      ],
    );
  }
}
