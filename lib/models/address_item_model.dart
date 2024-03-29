class AddressItemModel {
  final String name;
  final String city;
  final String region;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  AddressItemModel({
    required this.name,
    required this.city,
    required this.region,
    required this.isChecked,
    required this.onChanged,
  });
}
