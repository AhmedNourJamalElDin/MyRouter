import 'package:flutter/material.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/home/utils.dart';
import 'package:router_setting/home/widgets/ask_for_rebooting.dart';

class AskForRebootingContainer extends StatelessWidget {
  const AskForRebootingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DynUpdateModel?>(
      stream: RouterService.instance.dynDataStream,
      builder: (context, dynDataShot) => StreamBuilder<bool>(
        stream: RouterService.instance.shouldAskForRebootingStream,
        builder: (context, shouldAskForRebootingShot) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (child, animation) => SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            child: child,
          ),
          child: shouldAskForRebootingShot.data != true ||
                  dynDataShot.data == null ||
                  !isOffline(dynDataShot.data!.signal.modem)
              ? Container()
              : AskForRebooting(
                  onReboot: onReboot,
                  onDismiss: onDismiss,
                ),
        ),
      ),
    );
  }

  void onReboot() {
    RouterService.instance.reboot();
  }

  void onDismiss() {
    RouterService.instance.shouldAskForRebootingSubject.add(false);
  }
}
