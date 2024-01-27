import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_2/models/boarding_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  int pageNum = 0;

  List<BoardModel> boardList = [
      BoardModel(
        image: 'lib/assets/images/Sale3.jpg',
        shopeTitle: 'Explore many products',
        shopeSubTitle: ' Sub. title',
      ),
      BoardModel(
        image: 'lib/assets/images/Sale2.jpg',
        shopeTitle: 'Choose and Checkout',
        shopeSubTitle: 'Sub. title',
      ),
      BoardModel(
        image: 'lib/assets/images/Sale1.jpg',
        shopeTitle: 'Title',
        shopeSubTitle: 'Sub. title',
      ),
    ];
}
