import 'package:flutter/material.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/core/widgets/logo.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/home/utils.dart';

class ActivityLogo extends StatelessWidget {
  const ActivityLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DynUpdateModel?>(
      stream: RouterService.instance.dynDataSubject.stream,
      builder: (_, snapshot) => Logo(
        color: snapshot.hasData &&
                snapshot.data != null &&
                !isOffline(snapshot.data!.signal.modem)
            ? Colors.green
            : Colors.grey,
      ),
    );
  }
}
