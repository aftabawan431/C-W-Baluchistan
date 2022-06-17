import 'package:cw_blochistan/core/constants/app_messages.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/network/network_info.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../modals/forget_password_,request_model.dart';
import '../modals/forget_password_response_model.dart';
import '../modals/login_request_model.dart';
import '../modals/login_response_modal.dart';

class AuthRepoImp implements AuthRepository {
  final NetworkInfo networkInfo;

  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginResponseModel>> loginUser(LoginRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return Left(const NetworkFailure(AppMessages.noInternet));
    }
    print('here');
    try {
      return Right(await remoteDataSource.loginUser(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponseModel>> forgetPassword(ForgetPasswordRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return Left(const NetworkFailure(AppMessages.noInternet));
    }
    print('here');
    try {
      return Right(await remoteDataSource.forgetPassword(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
