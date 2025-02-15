import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class ProfileImageMenuItem extends StatelessWidget {
  const ProfileImageMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            File? imageFile = await cubit.pickImage();
            if (imageFile != null && context.mounted) {
              await cubit.encodeImageToBase64(imageFile);
            }
            if (context.mounted) Navigator.pop(context);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  radius: 15,
                  child: const Icon(
                    Icons.photo_outlined,
                    color: defaultColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Choose from library',
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            File? imageFile = await cubit.pickImage(source: ImageSource.camera);
            if (imageFile != null && context.mounted) {
              await cubit.encodeImageToBase64(imageFile);
            }
            if (context.mounted) Navigator.pop(context);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  radius: 15,
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: defaultColor,
                    size: 22.5,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Take new photo',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
