import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/modules/product/add_to_cart_button.dart';
import 'package:store_2/modules/product/price_row.dart';
import 'package:store_2/modules/product/product_image.dart';
import 'package:store_2/modules/product/smoth_page_idecator.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({
    super.key,
    required this.productModel,
    required this.fromCart,
    required this.isSearch,
    required this.cartID,
  });
  final ProductModel productModel;
  final bool fromCart;
  final bool isSearch;
  final int cartID;

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  bool isMore = false;
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
        final maxLine = isMore ? null : 6;
        final overflow = isMore ? TextOverflow.visible : TextOverflow.ellipsis;
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ProductImage(
                    pageController: pageController,
                    productModel: widget.productModel,
                  ),
                  const SizedBox(height: 8),
                  SmoothIndecator(
                    pageController: pageController,
                    productModel: widget.productModel,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.productModel.name!,
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
                    productModel: widget.productModel,
                    fromCart: widget.fromCart,
                    isSearch: widget.isSearch,
                    cartID: widget.cartID,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.productModel.description!,
                    maxLines: maxLine,
                    overflow: overflow,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 15, height: 1.1),
                  ),
                  InkWell(
                    onTap: () {
                      isMore = !isMore;
                      setState(() {});
                    } // show more details in the product page
                    ,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isMore ? 'Show less' : 'Show more',
                        ),
                        Icon(
                          isMore
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AddToCartButton(
                productModel: widget.productModel,
                state: state,
              ),
            ),
          ],
        );
      },
    );
  }
}
