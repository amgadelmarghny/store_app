import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/modules/product/add_to_cart_button.dart';
import 'package:store_2/modules/product/make_order_button.dart';
import 'package:store_2/modules/product/price_row.dart';
import 'package:store_2/modules/product/product_image.dart';
import 'package:store_2/modules/product/show_more_button.dart';
import 'package:store_2/modules/product/smoth_page_idecator.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody(
      {super.key,
      required this.productModel,
      required this.fromCart,
      required this.isSearch,
      required this.cartID});
  final ProductModel productModel;
  final bool fromCart;
  final bool isSearch;
  final int cartID;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is CartSussiccState) {
          toastShown(
            messege: state.changedCartModel.message,
            state: ToastState.success,
            context: context,
          );
        }
        if (state is CartFailureState) {
          toastShown(
            messege: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            ProductImage(
              pageController: pageController,
              productModel: productModel,
            ),
            const SizedBox(height: 8),
            SmoothIndecator(
              pageController: pageController,
              productModel: productModel,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productModel.name!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(height: 1.2),
            ),
            const SizedBox(
              height: 20,
            ),
            ProductPriceDetails(
              productModel: productModel,
              fromCart: fromCart,
              isSearch: isSearch,
              cartID: cartID,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              maxLines: BlocProvider.of<ShopCubit>(context).isMore ? 10000 : 9,
              productModel.description!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 15, height: 1.1),
            ),
            const ShowMoreButton(),
            const SizedBox(
              height: 30,
            ),
            AddToCartButton(
              productModel: productModel,
              state: state,
            ),
            const SizedBox(
              height: 20,
            ),
            const MakeOrderButton(),
          ],
        );
      },
    );
  }
}
