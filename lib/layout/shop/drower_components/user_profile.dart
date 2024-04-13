import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/profile/profile_view.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/avatar_pic.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProfileView.id);
      },
      child: BlocProvider.of<ShopCubit>(context).profileModel != null
          ? UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.transparent),
              currentAccountPicture: AvatarPic(
                image: BlocProvider.of<ShopCubit>(context)
                    .profileModel!
                    .user!
                    .image!,
              ),
              accountName: Text(
                BlocProvider.of<ShopCubit>(context).profileModel!.user!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              accountEmail: Text(
                BlocProvider.of<ShopCubit>(context).profileModel!.user!.email!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(),
              ),
            )
          : null,
    );
  }
}
