import 'package:flutter/material.dart';
import 'package:router_setting/sms/widgets/inbox.dart';

class SmsScreen extends StatefulWidget {
  SmsScreen({Key? key}) : super(key: key);

  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.sms, color: Colors.deepOrange)),
                  Tab(icon: Icon(Icons.sms, color: Colors.deepOrange)),
                  Tab(icon: Icon(Icons.sms, color: Colors.deepOrange)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Inbox(),
                    Inbox(),
                    Inbox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
