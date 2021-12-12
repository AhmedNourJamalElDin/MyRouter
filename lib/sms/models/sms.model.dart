import 'package:json_annotation/json_annotation.dart';

part 'sms.model.g.dart';

@JsonSerializable()
class SmsRequestModel {
  final int? total;
  @JsonKey(readValue: _readMessagesFromJson)
  final Map<String, MessageModel>? messages;

  SmsRequestModel({
    required this.total,
    required this.messages,
  });

  factory SmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SmsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmsRequestModelToJson(this);

  // messages are <key, value> pair such as "M1" => message data in the same json as the total field.
  static Map<String, dynamic> _readMessagesFromJson(Map map, String key) {
    return Map<String, dynamic>.fromEntries((map as Map<String, dynamic>).entries.where((item) => item.key != 'total'));
  }
}

@JsonSerializable()
class MessageModel {
  final String? phone;
  final String? date;
  final String? msg;
  final int? read;
  final int? storeInSim;
  final String? tag;
  @JsonKey(name: 'class')
  final int? klass;

  MessageModel({
    this.phone,
    this.date,
    this.msg,
    this.read,
    this.storeInSim,
    this.tag,
    this.klass,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
