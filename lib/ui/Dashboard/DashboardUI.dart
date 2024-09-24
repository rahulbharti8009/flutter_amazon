import 'package:flutter/material.dart';
import 'package:flutter_amazon/ui/Dashboard/DrawerUI.dart';
import 'package:flutter_amazon/ui/Dashboard/HomeUI.dart';
import 'package:flutter_amazon/ui/Dashboard/MessageUI.dart';
import 'package:flutter_amazon/ui/Dashboard/NotificationUI.dart';
import 'package:flutter_amazon/utils/ExtendFun.dart';
const TAG = "DashboardUI";
class DashboardUI extends StatefulWidget {
  final String id;

  const DashboardUI({super.key, required this.id});
  @override
  State<DashboardUI> createState() => DashboardStateUI();
}
var tag = "DashboardStateUI";
class DashboardStateUI extends State<DashboardUI> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Logger(TAG).log(widget.id);
    return Scaffold(
      appBar: AppBar(
          title: Text(getTitleName(currentPageIndex)),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
     drawer: Drawer(
        child: drawer(context, currentPageIndex, onClick: (int index) {
           setState(() {
             currentPageIndex = index;
             });
           Logger(tag).log("$index");
        }) ,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
            Logger(tag).log("$index");
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(
            child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          )
        ],
      ),
      body: <Widget>[
        const HomeUI(),
        const NotificationUI(),
        const MessageUI()
      ][currentPageIndex],
    );
  }
}