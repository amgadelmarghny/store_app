import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_item.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class ProductItemGridView extends StatelessWidget {
  const ProductItemGridView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  List productList =  BlocProvider.of<ShopCubit>(context).homeModel!.data!.productsList;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.54,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          productModel: productList[index],
        );
      },
      itemCount: productList.length,
    );
  }
}
