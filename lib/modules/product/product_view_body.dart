import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/modules/product/price_row.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody(
      {super.key,
      required this.productModel,
      required this.fromCart,
      required this.isSearch});
  final ProductModel productModel;
  final bool fromCart;
  final bool isSearch;
  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  bool isMore = false;
  bool isAdd = false;
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
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.3 - 20,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.productModel.images != null
                    ? widget.productModel.images!.length
                    : 1,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: widget.productModel.images != null
                        ? widget.productModel.images![index]
                        : widget.productModel.image,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  effect: WormEffect(
                    activeDotColor: defaultColor.shade200,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey.shade400,
                  ),
                  controller: pageController,
                  count: widget.productModel.images != null
                      ? widget.productModel.images!.length
                      : 1,
                ),
              ],
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
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              maxLines: isMore ? 10000 : 10,
              widget.productModel.description!,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(color: Colors.grey, fontSize: 18, height: 1),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isMore = !isMore;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isMore ? 'Show less' : 'Show more',
                  ),
                  Icon(isMore
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (!widget.fromCart)
              CustomButton(
                isLoading: state is CartLoadingState,
                color: defaultColor[300]!,
                text: isAdd ? 'Remove' : 'Add to Cart',
                onTap: () {
                  BlocProvider.of<ShopCubit>(context)
                      .addAndRemoveCart(
                    productId: widget.productModel.id,
                  )
                      .then((value) {
                    isAdd = !isAdd;
                    BlocProvider.of<ShopCubit>(context).getCartItems();
                  });
                },
              ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              color: defaultColor[600]!,
              text: 'Buy Now',
            ),
          ],
        );
      },
    );
  }
}