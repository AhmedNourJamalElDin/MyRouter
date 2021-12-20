// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dyn_update.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynUpdateModel _$DynUpdateModelFromJson(Map<String, dynamic> json) =>
    DynUpdateModel(
      signal: SignalModel.fromJson(json['signal'] as Map<String, dynamic>),
      battery: BatteryModel.fromJson(json['battery'] as Map<String, dynamic>),
      clientNum:
          ClientNumModel.fromJson(json['clientNum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DynUpdateModelToJson(DynUpdateModel instance) =>
    <String, dynamic>{
      'signal': instance.signal,
      'battery': instance.battery,
      'clientNum': instance.clientNum,
    };

SignalModel _$SignalModelFromJson(Map<String, dynamic> json) => SignalModel(
      modem: ModemModel.fromJson(json['modem'] as Map<String, dynamic>),
      wifi: WifiModel.fromJson(json['wifi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignalModelToJson(SignalModel instance) =>
    <String, dynamic>{
      'modem': instance.modem,
      'wifi': instance.wifi,
    };

ModemModel _$ModemModelFromJson(Map<String, dynamic> json) => ModemModel(
      level: json['level'] as int,
      maxLevel: json['max_level'] as int,
      opName: json['op_name'] as String,
      service: json['service'] as String?,
      strength: json['strength'] as int,
    );

Map<String, dynamic> _$ModemModelToJson(ModemModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'max_level': instance.maxLevel,
      'op_name': instance.opName,
      'service': instance.service,
      'strength': instance.strength,
    };

WifiModel _$WifiModelFromJson(Map<String, dynamic> json) => WifiModel(
      level: json['level'] as int,
      maxLevel: json['max_level'] as int,
      strength: json['strength'] as int,
    );

Map<String, dynamic> _$WifiModelToJson(WifiModel instance) => <String, dynamic>{
      'level': instance.level,
      'max_level': instance.maxLevel,
      'strength': instance.strength,
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

ClientNumModel _$ClientNumModelFromJson(Map<String, dynamic> json) =>
    ClientNumModel(
      ssid1: json['ssid1'] as int,
      ssid2: json['ssid2'] as int,
    );

Map<String, dynamic> _$ClientNumModelToJson(ClientNumModel instance) =>
    <String, dynamic>{
      'ssid1': instance.ssid1,
      'ssid2': instance.ssid2,
    };
