// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsRequestModel _$SmsRequestModelFromJson(Map<String, dynamic> json) =>
    SmsRequestModel(
      total: json['total'] as int?,
      messages: (SmsRequestModel._readMessagesFromJson(json, 'messages')
              as Map<String, dynamic>?)
          ?.map(
        (k, e) => MapEntry(k, MessageModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SmsRequestModelToJson(SmsRequestModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'messages': instance.messages,
    };

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      phone: json['phone'] as String?,
      date: json['date'] as String?,
      msg: json['msg'] as String?,
      read: json['read'] as int?,
      storeInSim: json['storeInSim'] as int?,
      tag: json['tag'] as String?,
      klass: json['class'] as int?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'date': instance.date,
      'msg': instance.msg,
      'read': instance.read,
      'storeInSim': instance.storeInSim,
      'tag': instance.tag,
      'class': instance.klass,
    };
