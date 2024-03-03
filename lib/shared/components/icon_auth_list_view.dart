import 'package:flutter/material.dart';
import 'package:store_2/shared/components/icon_item.dart';

class IconAuthlistView extends StatelessWidget {
  const IconAuthlistView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = const [
      'lib/assets/images/face book.png',
      'lib/assets/images/google.png',
      'lib/assets/images/apple.png',
    ];
    return Center(
      child: SizedBox(
        height: 59,
        width: (59 * 3) + 40,
        child: ListView.separated(
          itemBuilder: (context, index) => IconItem(
            image: icons[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemCount: icons.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
