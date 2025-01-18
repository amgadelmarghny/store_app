import 'package:soagmb/core/global/errors/error_model.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/user/data/models/change_password.dart';
import 'package:soagmb/features/user/data/models/change_user_password_parameter.dart';
import 'package:soagmb/features/user/data/models/profile_model.dart';
import 'package:soagmb/features/user/data/models/update_profile_parameter.dart';

abstract class BaseUpdateProfileDatasorce {
  Future<ProfileModel> updateProfile(UpdateProfileParameter parameter);

  Future<ChangePasswordModel> changeUserPassword(
      ChangeUserPasswordParameter parameter);
}

class UpdateProfileDatasorce implements BaseUpdateProfileDatasorce {
  @override
  Future<ProfileModel> updateProfile(UpdateProfileParameter parameter) async {
    final response = await DioHelper.putData(
      url: updateProfilePath,
      token: CashHelper.getData(key: tokenConst),
      data: {
        'name': parameter.name,
        'email': parameter.email,
        'phone': parameter.phone,
      },
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ChangePasswordModel> changeUserPassword(
      ChangeUserPasswordParameter parameter) async {
    final response = await DioHelper.postData(
      url: changePassword,
      token: CashHelper.getData(key: tokenConst),
      data: {
        'current_password': parameter.currentPassword,
        'new_password': parameter.newPassword,
      },
    );
    if (response.statusCode == 200) {
      return ChangePasswordModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
