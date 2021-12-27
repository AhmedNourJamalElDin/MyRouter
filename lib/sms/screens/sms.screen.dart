import 'package:flutter/material.dart';
import 'package:router_setting/sms/widgets/draft.dart';
import 'package:router_setting/sms/widgets/inbox.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({Key? key}) : super(key: key);

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
          length: 2,
          child: Column(
            children: const [
              TabBar(
                tabs: [
                  Tab(
                      icon: Icon(Icons.drafts_outlined,
                          color: Colors.deepOrange)),
                  Tab(icon: Icon(Icons.drafts, color: Colors.deepOrange)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Inbox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Draft(),
                    ),
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
