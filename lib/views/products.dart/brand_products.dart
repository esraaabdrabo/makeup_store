import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/brand.dart';
import 'package:store/widgets/commonWidgets.dart';

// ignore: must_be_immutable
class BrandProducts extends StatefulWidget {
  String brandName;
  BrandProducts(this.brandName, {Key? key}) : super(key: key);

  @override
  State<BrandProducts> createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  @override
  bool isfav = false;

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BrandVM(widget.brandName),
        builder: (context, child) {
          BrandVM provider = Provider.of(context);
          List<Product> products = provider.products;
          return Scaffold(
              backgroundColor: myThemeData.movcolor,
              appBar: CommonWidgets.appBAR(),
              body: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            //upper white line
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //product details
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        child: Column(
                                          children: [
                                            //name divider price
                                            CommonWidgets.prodNamePrice(
                                                context,
                                                products[index].name,
                                                products[index].price),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                //shooping cart
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.add_shopping_cart,
                                                      color: Colors.white,
                                                    )),
                                                //fav
                                                IconButton(
                                                    onPressed: () {
                                                      isfav
                                                          ? isfav = false
                                                          : isfav = true;
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      !isfav
                                                          ? Icons
                                                              .favorite_border
                                                          : Icons.favorite,
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            )
                                          ],
                                        )),
                                    //product img
                                    CommonWidgets.prodImg(context,
                                        products[index].apiFeaturedImage)
                                  ]),
                            ),
                            //lower white line
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * .02,
                            )
                          ],
                        );
                      }));
        });
  }
}
