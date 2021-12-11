import 'package:event_bus/event_bus.dart';

class EventProviderRegistrar {
  final providers = <EventProvider>[];

  void addEventProvider(EventProvider provider) {
    providers.add(provider);
  }

  Future<void> boot(EventBus eventBus) async {
    for (var provider in providers) {
      await provider.boot(eventBus);
    }
  }
}

abstract class EventProvider {
  Future<void> boot(EventBus eventBus);
}
