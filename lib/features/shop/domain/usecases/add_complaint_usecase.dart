import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/add_complaint_impl.dart';
import 'package:soagmb/features/shop/domain/entities/complaint.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class AddComplaintUsecase implements BaseUsecase<Complaint, AddComplaintImpl> {
  final BaseShopRepo repo;

  AddComplaintUsecase({required this.repo});

  @override
  Future<Either<Failure, Complaint>> call(AddComplaintImpl parameter) async {
    return repo.addComplaint(parameter);
  }
}
