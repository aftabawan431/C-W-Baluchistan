import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/constants/app_url.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/error_response_model.dart';
import '../../../../core/utils/encryption/encryption.dart';
import '../modals/forget_password_,request_model.dart';
import '../modals/forget_password_response_model.dart';
import '../modals/login_request_model.dart';
import '../modals/login_response_modal.dart';

abstract class AuthRemoteDataSource {
  /// This method gets the the email and password
  /// [Input]: [LoginRequestModel] contains email and password
  /// [Output] : if operation successful returns [LoginResponseModel] returns the successful login
  /// if unsuccessful the response will be [Failure]
  Future<LoginResponseModel> loginUser(LoginRequestModel params);

  /// This method gets password and email
  /// [Input]: [ForgetPasswordRequestModel] contains the request model parameters
  /// [Output] : if operation successful returns [ForgetPasswordResponseModel] returns the succe
  /// if unsuccessful the response will be [Failure]
  Future<ForgetPasswordResponseModel> forgetPassword(ForgetPasswordRequestModel params);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  @override
  Future<LoginResponseModel> loginUser(LoginRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.loginUrl;

    try {
      final response = await dio.get(url);

      var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200 && jsonResponse['StatusCode'] == '200') {
        var object = LoginResponseModel.fromJson(jsonResponse);

        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return object;
      }

      throw SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonResponse);
        throw SomethingWentWrong(errorResponseModel.statusMessage);
      }
    }
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(ForgetPasswordRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.loginUrl;

    try {
      final response = await dio.get(url);

      var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200 && jsonResponse['StatusCode'] == '200') {
        var object = ForgetPasswordResponseModel.fromJson(jsonResponse);

        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return object;
      }

      throw SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonResponse);
        throw SomethingWentWrong(errorResponseModel.statusMessage);
      }
    }
  }
}
