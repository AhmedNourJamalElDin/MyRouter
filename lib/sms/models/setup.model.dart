import 'package:json_annotation/json_annotation.dart';

part 'setup.model.g.dart';

@JsonSerializable()
class SmsSetupModel {
  @JsonKey(name: 'SMSC')
  final SmscModel smsc;

  SmsSetupModel({
    required this.smsc,
  });

  factory SmsSetupModel.fromJson(Map<String, dynamic> json) =>
      _$SmsSetupModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmsSetupModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SmscModel {
  final String? addrDigits;
  final int? smsIntoSim;

  SmscModel({
    required this.addrDigits,
    required this.smsIntoSim,
  });

  factory SmscModel.fromJson(Map<String, dynamic> json) =>
      _$SmscModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmscModelToJson(this);
}
