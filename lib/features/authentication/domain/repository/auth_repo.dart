import 'package:cw_blochistan/features/authentication/data/modals/forget_password_,request_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/modals/forget_password_response_model.dart';
import '../../data/modals/login_request_model.dart';
import '../../data/modals/login_response_modal.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> loginUser(LoginRequestModel params);
  Future<Either<Failure, ForgetPasswordResponseModel>> forgetPassword(ForgetPasswordRequestModel params);
}
