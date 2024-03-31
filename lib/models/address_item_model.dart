class CheckAddressItemModel {
  final bool isChecked;
  final void Function(bool?)? onChanged;

  CheckAddressItemModel({
    required this.isChecked,
    required this.onChanged,
  });
}
