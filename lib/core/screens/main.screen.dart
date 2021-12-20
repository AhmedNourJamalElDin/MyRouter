import 'package:flutter/material.dart';
import 'package:router_setting/accounts/screens/accounts.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/home/screens/home.dart';
import 'package:router_setting/sms/screens/sms.screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  var currentPage = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);

    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        AuthService.instance.logout();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        AuthService.instance.logout();
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
    AuthService.instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.blueGrey,
          onTap: (page) {
            pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'SMS',icon: Icon(Icons.drafts_sharp)),
            BottomNavigationBarItem(label: 'Accounts',icon: Icon(Icons.supervisor_account_sharp)),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (page) {
            currentPage = page;

            setState(() {});
          },
          children: const [
            HomeScreen(),
            SmsScreen(),
            AccountsScreen(),
          ],
        ),
      ),
    );
  }
}
