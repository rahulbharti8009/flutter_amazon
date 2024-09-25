import 'package:flutter/material.dart';
import 'package:flutter_amazon/ui/Dashboard/DashboardUI.dart';
import 'package:flutter_amazon/ui/LoginUI.dart';
import 'package:flutter_amazon/utils/constant.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  var isLogin = true;
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
          routes: {
            '/': (context) => isLogin ?  const LoginUI() : const DashboardUI(id: ''),
            CONST.dashboardUI: (context) => const DashboardUI(id: ''),
          },
    );  }
}

void stack(routeName){
  switch(routeName){
    case CONST.dashboardUI: break;
    default: break;
  }
}