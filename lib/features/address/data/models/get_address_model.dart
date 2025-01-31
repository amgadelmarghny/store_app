import 'package:soagmb/features/address/data/models/address_model.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';

class GetAddressesModel extends GetAddresses {
  const GetAddressesModel({
    required super.status,
    required super.message,
    required super.data,
  });
  factory GetAddressesModel.fromJson(Map<String, dynamic> json) =>
      GetAddressesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? AddressessListDataModel.fromJson(json["data"])
            : null,
      );
}

class AddressessListDataModel extends AddressessListData {
  const AddressessListDataModel({
    required super.total,
    required super.addressModelsList,
  });

  factory AddressessListDataModel.fromJson(Map<String, dynamic> json) =>
      AddressessListDataModel(
        total: json["total"],
        addressModelsList: List<AddressModel>.from(
          ((json['data'] as List).map((e) => AddressModel.fromJson(e))),
        ),
      );
}
