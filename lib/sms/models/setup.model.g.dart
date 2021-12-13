// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsSetupModel _$SmsSetupModelFromJson(Map<String, dynamic> json) =>
    SmsSetupModel(
      smsc: SmscModel.fromJson(json['SMSC'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SmsSetupModelToJson(SmsSetupModel instance) =>
    <String, dynamic>{
      'SMSC': instance.smsc,
    };

SmscModel _$SmscModelFromJson(Map<String, dynamic> json) => SmscModel(
      addrDigits: json['addr_digits'] as String?,
      smsIntoSim: json['sms_into_sim'] as int?,
    );

Map<String, dynamic> _$SmscModelToJson(SmscModel instance) => <String, dynamic>{
      'addr_digits': instance.addrDigits,
      'sms_into_sim': instance.smsIntoSim,
    };
