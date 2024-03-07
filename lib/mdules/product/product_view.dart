import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/product/product_view_body.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/bloc/product_cubit/product_cubit.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String id = '/product-view';

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
          child: ProductViewBody(productModel: productModel),
        ),
      ),
    );
  }
}
