import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_product_item_info_with_interaction.dart';
import 'package:soagmb/features/shop/presentation/views/product_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_image.dart';

class CategoryProductItem extends StatelessWidget {
  const CategoryProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductView.id,
          arguments: {'productModel': productModel},
        );
      },
      child: BlocBuilder<ShopCubit, ShopStates>(
        builder: (context, state) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: customBoxDecoration(context),
            child: Column(
              children: [
                ProductImage(
                  productModel: productModel,
                  discountPadding: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CategoryProductItemInfoWithInteraction(
                      productModel: productModel),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
