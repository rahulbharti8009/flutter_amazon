import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_amazon/utils/constant.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
      style: TextButton.styleFrom(
      foregroundColor: Colors.blue,
  ),
  onPressed: () {
      Navigator.pushNamed(context ,  CONST.dashboardUI);},
      child: Text('TextButton'),
),
    );
  }
}