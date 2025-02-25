import 'package:confession_app/authentication/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  // text controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Logs in the user with the provided email and password.
  ///
  /// This function triggers the
  /// [AuthService.signIn](https://pub.dev/documentation/supabase_flutter/latest/supabase_flutter/AuthService/signIn.html)
  /// method and can throw a [SupabaseException] if there is an error.
  ///
  /// The current implementation does not handle the error.


  void login() async {
    final email = _emailController;
    final password = _passwordController;

    try{
      await authService.signIn(email.text, password.text);
    } catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))) ;
      }
    }
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: login, child: const Text("login")),
        ],
        ),
    );
  }
}