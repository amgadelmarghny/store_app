import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/cart/get_cart.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class GetCartItemsUsecase implements BaseUsecase<GetCart, NoParameters> {
  final BaseShopRepo repo;

  GetCartItemsUsecase({required this.repo});

  @override
  Future<Either<Failure, GetCart>> call(NoParameters parameters) async {
    return await repo.getCartItems();
  }
}
