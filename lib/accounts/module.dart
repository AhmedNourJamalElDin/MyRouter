import 'package:modular/modular.dart';
import 'package:router_setting/accounts/providers/accounts_event_provider.dart';
import 'package:router_setting/accounts/providers/hive_accounts_boot_provider.dart';

@RegisterModule(order: 1)
class AccountsModule extends Module {
  AccountsModule(BootProviderRegistrar bootProviderRegistrar,
      EventProviderRegistrar eventProviderRegistrar)
      : super(bootProviderRegistrar, eventProviderRegistrar);

  @override
  Future<void> boot() async {
    bootProviderRegistrar.addBootProvider(HiveAccountsBootProvider());
    eventProviderRegistrar.addEventProvider(AccountsEventProvider());
  }
}
