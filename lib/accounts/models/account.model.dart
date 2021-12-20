import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'account.model.g.dart';

const String accountsBoxName = 'accounts';

@HiveType(typeId: 1)
class AccountModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  String url;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;

  AccountModel({
    required this.url,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [url, username, password];
}
