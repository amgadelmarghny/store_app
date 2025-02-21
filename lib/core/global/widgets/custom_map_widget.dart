import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soagmb/features/address/domain/entities/place.dart';

class CustomMapWidget extends StatefulWidget {
  const CustomMapWidget({super.key, required this.placeModel});
  final Place placeModel;

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};
  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: widget.placeModel.location,
      zoom: 15.0,
    );
    initMapStyle();
    initMarkers();
    super.initState();
  }

  String? genericGmap;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: genericGmap,
      initialCameraPosition: initialCameraPosition,
      markers: markers,
    );
  }

  void initMarkers() {
    var myMarker = Marker(
      markerId: MarkerId(widget.placeModel.id),
      position: widget.placeModel.location,
      infoWindow: InfoWindow(title: widget.placeModel.name),
    );
    markers.add(myMarker);
    setState(() {});
  }

  void initMapStyle() async {
    genericGmap = await DefaultAssetBundle.of(context)
        .loadString('lib/core/global/style/map_styles.json');
    setState(() {});
  }
}
