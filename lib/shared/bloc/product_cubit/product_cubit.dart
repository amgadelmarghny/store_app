import 'package:bloc/bloc.dart';
import 'package:store_2/models/fav_model/favorite_model.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

   ChangedFavoriteModel? changedCartModel;

  void addAndRemoveCart({required int productId}) async {
    emit(CartLoadingState());
    DioHelper.postData(
      url: 'carts',
      token: authToken,
      data: {"product_id": productId},
    ).then((value) {
      changedCartModel = ChangedFavoriteModel.fromJson(value.data);
      emit(CartSussiccState(changedCartModel: changedCartModel!));
    }).catchError((errMessage){
      emit(CartFailureState(errMessage: errMessage));
    });
  }
}
