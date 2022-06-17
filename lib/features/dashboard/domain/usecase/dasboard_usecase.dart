import 'package:cw_blochistan/features/dashboard/data/models/expenditure-response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/expenditure_request_request-model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/request_status_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/request_status_response_model.dart';
import 'package:cw_blochistan/features/dashboard/domain/repository/dashboard_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class InspectionReportUsecase extends UseCase<InspectionReportResponseModel, InspectionReportRequestModel> {
  DashboardRepository repository;
  InspectionReportUsecase(this.repository);

  @override
  Future<Either<Failure, InspectionReportResponseModel>> call(InspectionReportRequestModel params) async {
    return await repository.inspectionReport(params);
  }
}

class ExpenditureReportUsecase extends UseCase<ExpenditureResponseModel, ExpenditureRequestModel> {
  DashboardRepository repository;
  ExpenditureReportUsecase(this.repository);

  @override
  Future<Either<Failure, ExpenditureResponseModel>> call(ExpenditureRequestModel params) async {
    return await repository.expenditure(params);
  }
}

class ReleaseRequestsUsecase extends UseCase<ReleaseRequestResponseModel, ReleaseRequestRequestModel> {
  DashboardRepository repository;
  ReleaseRequestsUsecase(this.repository);

  @override
  Future<Either<Failure, ReleaseRequestResponseModel>> call(ReleaseRequestRequestModel params) async {
    return await repository.releaseRequest(params);
  }
}

class RequestStatusUsecase extends UseCase<RequestStatusResponseModel, RequestStatusRequestModel> {
  DashboardRepository repository;
  RequestStatusUsecase(this.repository);

  @override
  Future<Either<Failure, RequestStatusResponseModel>> call(RequestStatusRequestModel params) async {
    return await repository.requestStatus(params);
  }
}
