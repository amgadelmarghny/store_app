import 'package:flutter/material.dart';
import 'package:soagmb/models/category_model.dart';
import 'package:soagmb/core/global/style/colors.dart';

class CategoryItemNameBanner extends StatelessWidget {
  const CategoryItemNameBanner({
    super.key,
    required this.dataModel,
  });

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).height * 0.163,
      color: defaultColor[300]!.withValues(alpha: 0.84),
      child: Text(
        dataModel.name,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Theme.of(context).hintColor),
      ),
    );
  }
}
