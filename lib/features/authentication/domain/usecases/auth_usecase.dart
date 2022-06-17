import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/modals/forget_password_,request_model.dart';
import '../../data/modals/forget_password_response_model.dart';
import '../../data/modals/login_request_model.dart';
import '../../data/modals/login_response_modal.dart';
import '../repository/auth_repo.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginRequestModel> {
  AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginRequestModel params) async {
    return await repository.loginUser(params);
  }
}

class ForgetPasswordUsecase extends UseCase<ForgetPasswordResponseModel, ForgetPasswordRequestModel> {
  AuthRepository repository;
  ForgetPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, ForgetPasswordResponseModel>> call(ForgetPasswordRequestModel params) async {
    return await repository.forgetPassword(params);
  }
}
