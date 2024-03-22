import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/category_cubit/category_cubit.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: IconButton(
            onPressed: () {
              BlocProvider.of<CategoryCubit>(context)
                  .getCategoryDetails(categoryId: 43);
            },
            icon: const Icon(Icons.access_alarm)),
      ),
    );
  }
}
