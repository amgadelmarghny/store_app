import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/app_cubit/app_cubit.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({super.key});
  //final Products productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: BlocProvider.of<AppCubit>(context).isDark
                  ? Colors.grey.shade400
                  : Colors.black87,
              spreadRadius: 1.2),
        ],
      ),
      height: 90,
      child: Row(
        children: [
          Image.network(
            "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
            fit: BoxFit.cover,
            height: 90,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    // productModel.name!,
                    'scdv',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1.2, fontSize: 21),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  // productModel.name!,
                  'quantity :   3',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16),
                ),
                Text(
                  // productModel.name!,
                  'Price :   34546 EGP',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
