import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/allProducts_service.dart';
import '../components/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 90),
        child: FutureBuilder<List<ProductModel>>(
            future: ALLProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                List<ProductModel> productList = snapshot.data!;
                
                return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 95,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        productModel: productList[index],
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
