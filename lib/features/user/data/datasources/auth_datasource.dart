import 'package:soagmb/core/global/errors/error_model.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/data/models/login_model.dart';
import 'package:soagmb/features/user/data/models/register_model.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';

abstract class BaseAuthDatasource {
  Future<LoginModel> loginUser(LoginUserParameter loginUserParameter);

  Future<RegisterModel> registerUser(
      RegisterUserParameter registerUserParameter);
}

class AuthDatasource implements BaseAuthDatasource {
  @override
  Future<LoginModel> loginUser(LoginUserParameter loginUserParameter) async {
    final response = await DioHelper.postData(
      url: login,
      data: {
        "email": loginUserParameter.email,
        "password": loginUserParameter.password,
      },
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<RegisterModel> registerUser(
      RegisterUserParameter registerUserParameter) async {
    final response = await DioHelper.postData(
      url: register,
      data: {
        "name": registerUserParameter.name,
        "email": registerUserParameter.email,
        "password": registerUserParameter.password,
        "phone": registerUserParameter.phone,
      },
    );
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
