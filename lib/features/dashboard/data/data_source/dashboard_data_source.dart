import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_response_model.dart';
import 'package:dio/dio.dart';

import '../models/expenditure-response_model.dart';
import '../models/expenditure_request_request-model.dart';
import '../models/release_requests_request_model.dart';
import '../models/release_requests_response_model.dart';
import '../models/request_status_request_model.dart';
import '../models/request_status_response_model.dart';

abstract class DashboardDataSource {
  Future<InspectionReportResponseModel> inspectionReport(InspectionReportRequestModel params);
  Future<ReleaseRequestResponseModel> releaseReport(ReleaseRequestRequestModel params);
  Future<ExpenditureResponseModel> expenditure(ExpenditureRequestModel params);
  Future<RequestStatusResponseModel> requestStatus(RequestStatusRequestModel params);
}

class AuthRemoteDataSourceImp implements DashboardDataSource {
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  @override
  Future<InspectionReportResponseModel> inspectionReport(InspectionReportRequestModel params) {
    // TODO: implement inspectionReport
    throw UnimplementedError();
  }

  @override
  Future<ReleaseRequestResponseModel> releaseReport(ReleaseRequestRequestModel params) {
    // TODO: implement releaseReport
    throw UnimplementedError();
  }

  @override
  Future<ExpenditureResponseModel> expenditure(ExpenditureRequestModel params) {
    // TODO: implement expenditure
    throw UnimplementedError();
  }

  @override
  Future<RequestStatusResponseModel> requestStatus(RequestStatusRequestModel params) {
    // TODO: implement requestStatus
    throw UnimplementedError();
  }
}
