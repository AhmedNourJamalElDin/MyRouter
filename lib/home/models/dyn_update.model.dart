import 'package:json_annotation/json_annotation.dart';

part 'dyn_update.model.g.dart';

@JsonSerializable()
class DynUpdateModel {
  final SignalModel signal;
  final BatteryModel battery;

  DynUpdateModel({
    required this.signal,
    required this.battery,
  });

  factory DynUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$DynUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DynUpdateModelToJson(this);
}

@JsonSerializable()
class SignalModel {
  final ModemModel modem;

  SignalModel({required this.modem});

  factory SignalModel.fromJson(Map<String, dynamic> json) =>
      _$SignalModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModemModel {
  final int level;
  final int maxLevel;

  ModemModel({
    required this.level,
    required this.maxLevel,
  });

  factory ModemModel.fromJson(Map<String, dynamic> json) =>
      _$ModemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModemModelToJson(this);
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
