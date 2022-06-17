import 'package:equatable/equatable.dart';

class ForgetPasswordRequestModel extends Equatable {
  const ForgetPasswordRequestModel({
    required this.clientId,
  });

  final int clientId;

  factory ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordRequestModel(
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
