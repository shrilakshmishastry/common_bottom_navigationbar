import 'package:flutter/material.dart';
import 'package:tabbar_experiment/calender.dart';
import 'package:tabbar_experiment/home.dart';
import 'package:tabbar_experiment/page2.dart';
import 'package:tabbar_experiment/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          key: globalKey,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(Icons.person_outline)),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calender',
                activeIcon: Icon(Icons.calendar_today_outlined)),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
        ]),
      ),
    );
  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
  }

  void _handleTap() {
    BottomNavigationBar nav = globalKey.currentWidget;
    nav.onTap(2);
  }

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context, int index) {
    return {
      "/": (context) {
        return [
          Home(
            handleTap: _handleTap,
          ),
          Profile(),
          Calender(
            onNext: _next,
          ),
        ].elementAt(index);
      }
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilder = _routeBuilder(context, index);
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilder[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
