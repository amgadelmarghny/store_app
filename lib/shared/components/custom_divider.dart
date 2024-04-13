import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/app_cubit/app_cubit.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: BlocProvider.of<AppCubit>(context).isDark
          ? Colors.grey.shade700
          : Colors.grey.shade400,
      height: 0,
      thickness: 0.6,
    );
  }
}