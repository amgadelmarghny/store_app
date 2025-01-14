import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class BannerItemListView extends StatelessWidget {
  const BannerItemListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
     ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    return CarouselSlider(
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
                const Center(child: Icon(Icons.error)),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
