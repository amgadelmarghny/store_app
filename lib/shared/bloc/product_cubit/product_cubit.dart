import 'package:bloc/bloc.dart';
import 'package:store_2/models/favorite_model.dart';
import 'package:store_2/models/get_cart_model.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  ChangedFavoriteModel? changedCartModel;
  bool isAdd = false;

  Future addAndRemoveCart({required int productId}) async {
    emit(CartLoadingState());
    await DioHelper.postData(
      url: carts,
      token: authToken,
      data: {"product_id": productId},
    ).then((value) {
      changedCartModel = ChangedFavoriteModel.fromJson(value.data);
      emit(CartSussiccState(changedCartModel: changedCartModel!));
    }).catchError((errMessage) {
      emit(CartFailureState(errMessage: errMessage));
    });
  }

  //////////////////////////////// CET CART  PRODUCTS ////////////////////////////
   GetCartModel? cartModel;

  void getCartItems() {
    emit(GetCartLoadingState());
    DioHelper.getData(
      url: carts,
      token: authToken,
    ).then((value) {
      cartModel = GetCartModel.fromJson(value.data);
      emit(GetCartSuccessState());
    }).catchError((err) {
      emit(GetCartFailureState(errMessage: err.toString()));
    });
  }
}
