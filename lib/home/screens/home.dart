import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/core/widgets/logo.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/home/widgets/dyn_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final CountdownTimerController countdownTimerController;

  @override
  void initState() {
    super.initState();
    RouterService.instance.dynUpdate();

    initTimer();
  }

  get endTime => DateTime.now().millisecondsSinceEpoch + 1000 * 5;

  void initTimer() {
    countdownTimerController =
        CountdownTimerController(endTime: endTime, onEnd: onTimerEnd);
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.restart_alt_sharp, color: Colors.deepOrange),
              onPressed: reset,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.logout, color: Colors.deepOrange),
              onPressed: logout,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<DynUpdateModel?>(
                stream: RouterService.instance.dynDataSubject.stream,
                builder: (_, snapshot) => Logo(
                  color: snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.signal.modem.level > 0
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
              SizedBox(height: 50),
              DynData(),
              SizedBox(height: 50),
              CountdownTimer(
                controller: countdownTimerController,
                widgetBuilder: (_, time) {
                  if (time == null) {
                    return Center(
                      child: Text("Updating!"),
                    );
                  }

                  return Center(
                    child: Text("Updating in " +
                        time.sec.toString().padLeft(2, '0') +
                        " sec"),
                  );
                },
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
    countdownTimerController.dispose();
    try {
      await RouterService.instance.reboot();
    } catch (e) {
      initTimer();
    }
  }

  Future<void> onTimerEnd() async {
    await RouterService.instance.dynUpdate();

    restartTimer();
  }

  void restartTimer() {
    countdownTimerController.endTime = endTime;
    countdownTimerController.start();
  }
}
