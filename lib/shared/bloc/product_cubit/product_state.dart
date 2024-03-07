part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

class CartLoadingState extends ProductState {}

class CartSussiccState extends ProductState {
  final ChangedFavoriteModel changedCartModel;
  CartSussiccState({required this.changedCartModel});
}

class CartFailureState extends ProductState {
  final String errMessage;

  CartFailureState({required this.errMessage});
}
