import 'package:equatable/equatable.dart';

class OnBoardModel extends Equatable {
  final String image;
  final String shopTitle;
  final String shopSubTitle;

  const OnBoardModel({
    required this.image,
    required this.shopTitle,
    required this.shopSubTitle,
  });

  @override
  List<Object?> get props => [image, shopSubTitle, shopTitle];
}
