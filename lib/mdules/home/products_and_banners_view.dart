import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/home/category_item.dart';
import 'package:store_2/mdules/home/product_item.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: shopCubit.homeModel!.data!.bannersList
                  .map(
                    (e) => Image.network(
                      e.image,
                      fit: BoxFit.cover,
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
            SizedBox(
              height: 130,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategotryItem(
                    dataModel: shopCubit.categoryHomeModel!.dataCatHome!.dataList[index],
                  );
                },
                separatorBuilder: (contex, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                itemCount: shopCubit.categoryHomeModel!.dataCatHome!.dataList.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //////////////////////////// PRODUCTS LIST /////////////////////////
            const Text('Products'),
            const SizedBox(
              height: 5,
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
