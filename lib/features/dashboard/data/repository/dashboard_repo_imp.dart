import 'package:cw_blochistan/core/constants/app_messages.dart';
import 'package:cw_blochistan/features/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:cw_blochistan/features/dashboard/data/models/expenditure-response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/expenditure_request_request-model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/request_status_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/request_status_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/network/network_info.dart';
import '../../domain/repository/dashboard_repo.dart';
import '../models/inspection_report_request_model.dart';

class DashboardRepoImp implements DashboardRepository {
  final NetworkInfo networkInfo;

  final DashboardDataSource dashboardDataSource;

  DashboardRepoImp({
    required this.networkInfo,
    required this.dashboardDataSource,
  });

  @override
  Future<Either<Failure, ExpenditureResponseModel>> expenditure(ExpenditureRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await dashboardDataSource.expenditure(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, InspectionReportResponseModel>> inspectionReport(InspectionReportRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await dashboardDataSource.inspectionReport(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, ReleaseRequestResponseModel>> releaseRequest(ReleaseRequestRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await dashboardDataSource.releaseReport(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, RequestStatusResponseModel>> requestStatus(RequestStatusRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await dashboardDataSource.requestStatus(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
