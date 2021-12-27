import 'package:router_setting/home/models/dyn_update.model.dart';

bool isOffline(ModemModel model) {
  return model.service == 'none';
}
