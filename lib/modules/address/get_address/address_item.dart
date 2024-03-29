import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: null, onChanged: (value){
      }),
      title: const Text('Name'),
      subtitle: const Text('City, region'),
      onTap: () {},
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
