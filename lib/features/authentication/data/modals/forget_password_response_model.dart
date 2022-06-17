import 'package:equatable/equatable.dart';

class ForgetPasswordResponseModel extends Equatable {
  const ForgetPasswordResponseModel({
    required this.clientId,
  });

  final int clientId;

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponseModel(
      clientId: json['clientId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    _data['clientId'] = clientId;

    return _data;
  }

  @override
  List<Object?> get props => [
        clientId,
      ];
}
