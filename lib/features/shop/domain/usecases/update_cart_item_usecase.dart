import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/cart/update_cart.dart';
import 'package:soagmb/features/shop/domain/entities/update_cart_items_impl.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class UpdateCartItemUsecase
    implements BaseUsecase<UpdateCart, UpdateCartItemsImpl> {
  final BaseShopRepo repo;

  UpdateCartItemUsecase({required this.repo});

  @override
  Future<Either<Failure, UpdateCart>> call(
      UpdateCartItemsImpl parameters) async {
    return repo.updateCartItems(parameters);
  }
}
