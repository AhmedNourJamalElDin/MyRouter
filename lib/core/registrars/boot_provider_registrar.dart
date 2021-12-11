
class BootProviderRegistrar {
  final providers = <BootProvider>[];

  void addBootProvider(BootProvider provider) {
    providers.add(provider);
  }

  Future<void> boot() async {
    for (var provider in providers) {
      await provider.boot();
    }
  }
}

abstract class BootProvider {
  Future<void> boot();
}
