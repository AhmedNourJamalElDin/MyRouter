import 'package:event_bus/event_bus.dart';

class EventProviderRegistrar {
  final _providers = <EventProvider>[];

  void addEventProvider(EventProvider provider) {
    _providers.add(provider);
  }

  Future<void> boot(EventBus eventBus) async {
    for (var provider in _providers) {
      await provider.boot(eventBus);
    }
  }
}

abstract class EventProvider {
  Future<void> boot(EventBus eventBus);
}
