import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/models/catergory_model.dart';
import 'package:Sourban/modules/category/category_details/category_details_view.dart';
import 'package:Sourban/shared/bloc/category_cubit/category_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

class CategotryItem extends StatelessWidget {
  const CategotryItem({super.key, required this.dataModel});
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
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.0,
              offset: Offset(2, 2),
              blurRadius: 3,
            )
          ],
        ),
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
              color: defaultColor[300]!.withOpacity(0.84),
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
