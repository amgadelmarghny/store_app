import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/category/presentation/views/category_details_view.dart';
import 'package:soagmb/features/shop/domain/entities/category.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_item_name_banner.dart';
import 'package:soagmb/features/category/presentation/category_cubit/category_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';

class CategoryHomeItem extends StatelessWidget {
  const CategoryHomeItem({super.key, required this.categoryModel});
  final Category categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryDetailsView.id,
          arguments: categoryModel.name,
        );
        BlocProvider.of<CategoryCubit>(context)
            .getCategoryDetails(categoryId: categoryModel.id);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: customBoxDecoration(context),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: categoryModel.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: defaultColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            CategoryItemNameBanner(dataModel: categoryModel)
          ],
        ),
      ),
    );
  }
}
