import 'package:cw_blochistan/features/dashboard/data/models/expenditure-response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/expenditure_request_request-model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/inspection_report_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_request_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/release_requests_response_model.dart';
import 'package:cw_blochistan/features/dashboard/data/models/request_status_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/request_status_response_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, InspectionReportResponseModel>> inspectionReport(InspectionReportRequestModel params);
  Future<Either<Failure, ReleaseRequestResponseModel>> releaseRequest(ReleaseRequestRequestModel params);
  Future<Either<Failure, ExpenditureResponseModel>> expenditure(ExpenditureRequestModel params);
  Future<Either<Failure, RequestStatusResponseModel>> requestStatus(RequestStatusRequestModel params);
}
