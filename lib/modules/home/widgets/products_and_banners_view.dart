import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/home/widgets/category_item.dart';
import 'package:store_2/modules/home/widgets/product_item.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class ProductAndBannerView extends StatelessWidget {
  const ProductAndBannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: shopCubit.homeModel!.data!.bannersList
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: defaultColor,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /////////////////////////// CATEGORIES lIST ///////////////////
            const Text('Categories'),
            const SizedBox(
              height: 5,
            ),
            if (shopCubit.categoryHomeModel?.dataCatHome?.dataList != null)
              SizedBox(
                height: 130,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 1),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (shopCubit
                            .categoryHomeModel!.dataCatHome!.dataList[index] !=
                        null) {
                      return CategotryItem(
                        dataModel: shopCubit
                            .categoryHomeModel?.dataCatHome?.dataList[index],
                      );
                    }
                    return null;
                  },
                  separatorBuilder: (contex, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount:
                      shopCubit.categoryHomeModel!.dataCatHome!.dataList.length,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            //////////////////////////// PRODUCTS LIST /////////////////////////
            const Text('Products'),
            const SizedBox(
              height: 7,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.472,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  productModel: shopCubit.homeModel!.data!.productsList[index],
                );
              },
              itemCount: shopCubit.homeModel!.data!.productsList.length,
            )
          ],
        ),
      ),
    );
  }
}
