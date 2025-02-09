import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soagmb/features/address/domain/entities/place.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key, required this.placeModel});
  final Place placeModel;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};
  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: widget.placeModel.location,
    );
    initMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.placeModel.location,
        zoom: 14.0,
      ),
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
}
