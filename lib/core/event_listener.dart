import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/accounts/services/accounts.service.dart';
import 'package:router_setting/auth/events.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/main.dart';

void configureEventListener() {
  eventBus.on<LoggedInEvent>().listen((event) async {
    var accountsService = AccountsService();
    var account = AccountModel(
      url: event.url,
      username: event.username,
      password: event.password,
    );

    if(accountsService.has(account)) {
      return;
    }

    print("OK?? WE HERE");
    final result = await DialogService().confirmation(
      "A new account detected!",
      subtitle: "Do you want to add this new account to the saved accounts?",
    );

    if (result == false) {
      return;
    }

    accountsService.create(account);
  });
}
