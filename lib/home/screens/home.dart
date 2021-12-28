import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/core/widgets/max_height_single_child_scroll_view.dart';
import 'package:router_setting/home/widgets/action_icon_button.dart';
import 'package:router_setting/home/widgets/activity_logo.dart';
import 'package:router_setting/home/widgets/ask_for_rebooting.container.dart';
import 'package:router_setting/home/widgets/dyn_data.dart';
import 'package:router_setting/home/widgets/refresh_timer.dart';
import 'package:separated_column/separated_column.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late final CountdownTimerController refreshTimer;

  @override
  void initState() {
    super.initState();
    RouterService.instance.dynUpdate();

    initTimer();
  }

  get endTime => DateTime.now().millisecondsSinceEpoch + 1000 * 5;

  void initTimer() {
    refreshTimer = CountdownTimerController(
      endTime: endTime,
      onEnd: onTimerEnd,
    );
  }

  @override
  void dispose() {
    super.dispose();
    refreshTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            if (AuthService.instance.baseUri != null)
              ActionIconButton(
                tooltipMessage: 'Open router\'s settings page',
                onPressed: openInBrowser,
              ),
            const Spacer(),
            ActionIconButton(
              tooltipMessage: "Reboot the router",
              onPressed: reset,
            ),
            ActionIconButton(
              tooltipMessage: "Logout",
              onPressed: logout,
            ),
          ],
        ),
      ),
      body: Center(
        child: MaxHeightSingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const AskForRebootingContainer(),
              const ActivityLogo(),
              const SizedBox(),
              SeparatedColumn(
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                children: [
                  const DynData(),
                  RefreshTimer(controller: refreshTimer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout() {
    AuthService.instance.logout();
  }

  Future<void> reset() async {
    refreshTimer.disposeTimer();
    try {
      await RouterService.instance.reboot();
    } catch (e) {
      initTimer();
    }
  }

  Future<void> onTimerEnd() async {
    if (!AuthService.instance.isLoggedIn) {
      return;
    }

    await RouterService.instance.dynUpdate();
    restartTimer();
  }

  void restartTimer() {
    refreshTimer.endTime = endTime;
    refreshTimer.start();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> openInBrowser() async {
    final url = AuthService.instance.baseUri!.toString();
    await launch(url);
  }
}
