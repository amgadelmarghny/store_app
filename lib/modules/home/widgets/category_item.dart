import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/category_model.dart';
import 'package:soagmb/modules/category/category_details/category_details_view.dart';
import 'package:soagmb/shared/bloc/category_cubit/category_cubit.dart';
import 'package:soagmb/shared/style/colors.dart';
import 'package:soagmb/shared/style/themes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.dataModel});
  final DataModel dataModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryDetailsView.id,
          arguments: dataModel.name,
        );
        BlocProvider.of<CategoryCubit>(context)
            .getCategoryDetails(categoryId: dataModel.id);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: customBoxDecoration(context),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: dataModel.image,
              height: 130,
              width: 130,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              width: 130,
              color: defaultColor[300]!.withValues(alpha: 0.84),
              child: Text(
                dataModel.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
