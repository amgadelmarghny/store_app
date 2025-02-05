import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/banners_home.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class Home extends Equatable {
  final bool status;
  final String? message;
  final HomeData? data;

  const Home({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class HomeData extends Equatable {
  final List<BannersHome> bannersList;
  final List<Product> productsList;

  const HomeData({
    required this.bannersList,
    required this.productsList,
  });

  @override
  List<Object?> get props => [bannersList, productsList];
}
