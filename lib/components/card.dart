import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/updateproduct_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        UpdateProductPage.iD,
        arguments: productModel,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            //height: 130,
            //width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                //حدة الشادو
                blurRadius: 40,
                //مسافة الشادو حوالينه
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.1),
                //طول وعرض الشادو
                offset: const Offset(10, 10),
              )
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productModel.title.substring(0, 7),
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' ' ${productModel.price.toString()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -65,
            right: 22,
            child: Image.network(
              productModel.image,
              height: 110,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
