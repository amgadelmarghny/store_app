import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/domain/entities/place.dart';
import 'package:soagmb/core/global/widgets/custom_map_widget.dart';
import 'package:soagmb/features/address/presentation/widgets/address_field.dart';

class OrderItemAddressSection extends StatelessWidget {
  const OrderItemAddressSection({
    super.key,
    required this.addressModel,
  });

  final Address addressModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    nameController.text = addressModel.name;
    cityController.text = addressModel.city;
    regionController.text = addressModel.region;
    detailsController.text = addressModel.details;
    if (addressModel.notes != null) {
      notesController.text = addressModel.notes!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddressField(
              width: 110,
              label: 'name',
              isOrderView: true,
              textEditingController: nameController,
            ),
            AddressField(
              label: 'city',
              width: 140,
              isOrderView: true,
              textEditingController: cityController,
            ),
          ],
        ),
        const SizedBox(height: 8),
        AddressField(
          label: 'region',
          isOrderView: true,
          textEditingController: regionController,
        ),
        const SizedBox(height: 8),
        AddressField(
          label: 'details',
          isOrderView: true,
          textEditingController: detailsController,
        ),
        if (notesController.text != '') const SizedBox(height: 10),
        if (notesController.text != '')
          AddressField(
            label: 'notes',
            maxLine: 3,
            hintText: 'Note',
            isRequired: false,
            isOrderView: true,
            textEditingController: notesController,
          ),
        SizedBox(
          height: 18,
        ),
        SizedBox(
          height: 200,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: CustomMapWidget(
              placeModel: Place(
                id: addressModel.id.toString(),
                name: addressModel.name,
                location: LatLng(addressModel.latitude, addressModel.longitude),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
