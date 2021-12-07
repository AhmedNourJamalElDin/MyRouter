// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dyn_update.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynUpdateModel _$DynUpdateModelFromJson(Map<String, dynamic> json) =>
    DynUpdateModel(
      signal: SignalModel.fromJson(json['signal'] as Map<String, dynamic>),
      battery: BatteryModel.fromJson(json['battery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DynUpdateModelToJson(DynUpdateModel instance) =>
    <String, dynamic>{
      'signal': instance.signal,
      'battery': instance.battery,
    };

SignalModel _$SignalModelFromJson(Map<String, dynamic> json) => SignalModel(
      modem: ModemModel.fromJson(json['modem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignalModelToJson(SignalModel instance) =>
    <String, dynamic>{
      'modem': instance.modem,
    };

ModemModel _$ModemModelFromJson(Map<String, dynamic> json) => ModemModel(
      level: json['level'] as int,
      maxLevel: json['max_level'] as int,
    );

Map<String, dynamic> _$ModemModelToJson(ModemModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'max_level': instance.maxLevel,
    };

BatteryModel _$BatteryModelFromJson(Map<String, dynamic> json) => BatteryModel(
      level: json['level'] as int,
      capacity: json['capacity'] as int,
      charging: json['charging'] as int,
    );

Map<String, dynamic> _$BatteryModelToJson(BatteryModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'charging': instance.charging,
      'capacity': instance.capacity,
    };
