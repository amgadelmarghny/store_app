import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/profile_image_menu_items.dart';

class UpdateProfileImage extends StatelessWidget {
  const UpdateProfileImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return GestureDetector(
      onTap: () {
        showPopover(
            height: 100,
            width: 250,
            context: context,
            bodyBuilder: (context) => const ProfileImageMenuItem());
      },
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 120),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: defaultColor[100], shape: BoxShape.circle),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: cubit.imageFile == null
                      ? CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: defaultColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(
                              Icons.error_outline,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : Image.file(
                          cubit.imageFile!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: defaultColor[100],
                  child: Icon(Icons.camera_alt_outlined)))
        ],
      ),
    );
  }
}
