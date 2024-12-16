import 'package:flutter/material.dart';
import 'package:soagmb/modules/home/widgets/product_item_grid_view.dart';

class Productssection extends StatelessWidget {
  const Productssection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Products'),
        const SizedBox(
          height: 7,
        ),
        ProductItemGridView(),
      ],
    );
  }
}
