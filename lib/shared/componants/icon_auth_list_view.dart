import 'package:flutter/material.dart';
import 'package:store_2/shared/componants/icon_item.dart';

class IconAuthlistViet extends StatelessWidget {
  const IconAuthlistViet({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = const [
      'lib/assets/images/face book.png',
      'lib/assets/images/google.png',
      'lib/assets/images/apple.png',
    ];
    return ListView.separated(
      itemBuilder: (context, index) => IconItem(
        image: icons[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      itemCount: icons.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
