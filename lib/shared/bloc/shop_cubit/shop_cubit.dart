import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
   
}
