import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/custom_map_widget.dart';
import 'package:soagmb/features/address/domain/entities/place.dart';

class MyLocationMapView extends StatelessWidget {
  const MyLocationMapView({super.key});
  static const id = 'MyLocationMapView';

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.settingsOf(context)!.arguments as Place;
    return Scaffold(
      body: CustomMapWidget(placeModel: place),
    );
  }
}
