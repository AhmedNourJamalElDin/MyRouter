import 'package:flutter/material.dart';
import 'package:router_setting/accounts/screens/accounts.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/home/screens/home.dart';

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
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceIn,
            );
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Accounts',icon: Icon(Icons.supervisor_account_sharp)),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (page) {
            currentPage = page;

            setState(() {});
          },
          children: [
            HomeScreen(),
            AccountsScreen(),
          ],
        ),
      ),
    );
  }
}
