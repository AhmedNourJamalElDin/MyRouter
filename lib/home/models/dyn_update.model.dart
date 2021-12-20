import 'package:json_annotation/json_annotation.dart';

part 'dyn_update.model.g.dart';

@JsonSerializable()
class DynUpdateModel {
  final SignalModel signal;
  final BatteryModel battery;
  final ClientNumModel clientNum;

  DynUpdateModel({
    required this.signal,
    required this.battery,
    required this.clientNum,
  });

  factory DynUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$DynUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DynUpdateModelToJson(this);
}

@JsonSerializable()
class SignalModel {
  final ModemModel modem;
  final WifiModel wifi;

  SignalModel({
    required this.modem,
    required this.wifi,
  });

  factory SignalModel.fromJson(Map<String, dynamic> json) =>
      _$SignalModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModemModel {
  final int level;
  final int maxLevel;
  final String opName;
  final String? service;
  final int strength;

  ModemModel({
    required this.level,
    required this.maxLevel,
    required this.opName,
    required this.service,
    required this.strength,
  });

  factory ModemModel.fromJson(Map<String, dynamic> json) =>
      _$ModemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModemModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WifiModel {
  final int level;
  final int maxLevel;
  final int strength;

  WifiModel({
    required this.level,
    required this.maxLevel,
    required this.strength,
  });

  factory WifiModel.fromJson(Map<String, dynamic> json) =>
      _$WifiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WifiModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BatteryModel {
  final int level;
  final int charging;
  final int capacity;

  BatteryModel({
    required this.level,
    required this.capacity,
    required this.charging,
  });

  factory BatteryModel.fromJson(Map<String, dynamic> json) =>
      _$BatteryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BatteryModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ClientNumModel {
  final int ssid1;
  final int ssid2;

  ClientNumModel({
    required this.ssid1,
    required this.ssid2,
  });

  factory ClientNumModel.fromJson(Map<String, dynamic> json) =>
      _$ClientNumModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientNumModelToJson(this);
}
