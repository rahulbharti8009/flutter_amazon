import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_amazon/utils/ExtendFun.dart';
import 'package:flutter_amazon/utils/constant.dart';
const TAG = "LoginUI";
class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
    final _usernameController = TextEditingController(text: 'user');
  final _passwordController = TextEditingController(text: 'password');
    String _errorMessage = '';

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    Logger(TAG).log(username);
    Logger(TAG).log(password);
    // Here you would usually validate the credentials
    if (username == 'user' && password == 'password') {
      // Navigate to another page or perform some action
      setState(() {_errorMessage = ''; });
        Navigator.pushNamed(context ,  CONST.dashboardUI);
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDBE9F3), Color.fromARGB(255, 239, 211, 244)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        ),
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                obscureText: false,
              controller: _usernameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Username',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
        ),
    );
  }
}


//  child: TextButton(
//       style: TextButton.styleFrom(
//       foregroundColor: Colors.blue,
//   ),
//           onPressed: () {
//               Navigator.pushNamed(context ,  CONST.dashboardUI);},
//               child: Text('TextButton'),
//         ),