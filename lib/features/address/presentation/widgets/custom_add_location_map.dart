import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soagmb/core/network/local/resize_and_convert_image.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';

class CustomAddLocationMap extends StatefulWidget {
  const CustomAddLocationMap({super.key, required this.locationName});
  final String locationName;

  @override
  State<CustomAddLocationMap> createState() => _CustomAddLocationMapState();
}

class _CustomAddLocationMapState extends State<CustomAddLocationMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  String? genericGmap;

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(28.521461857709834, 30.730197300230614),
      zoom: 5,
    );
    initMapStyle();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      style: genericGmap,
      onMapCreated: (controller) {
        mapController = controller;
      },
    );
  }

  void initMapStyle() async {
    genericGmap = await DefaultAssetBundle.of(context)
        .loadString('lib/core/global/style/map_styles.json');
    setState(() {});
  }

  void getCurrentLocation() async {
    var locationData = await AddressCubit.get(context).getCurrentLocation();
    Uint8List image = await getImageFromRowData(
        'lib/core/global/assets/images/cuurent location.png', 18);
    BitmapDescriptor currentMarkLocation = BitmapDescriptor.bytes(image);

    if (locationData != null && mounted) {
      LatLng currentLatLngLocation =
          LatLng(locationData.latitude!, locationData.longitude!);

      AddressCubit.get(context).locationLatLng = currentLatLngLocation;
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLngLocation, 16),
      );
      if (mounted) {
        setState(() {
          var myMarker = Marker(
            icon: currentMarkLocation,
            markerId: MarkerId(widget.locationName),
            position: currentLatLngLocation,
          );
          markers.add(myMarker);
        });
      }
    }
  }
}
