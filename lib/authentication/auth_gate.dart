/*
  AUTH GATE: this will continuously listen for autentication state changes

  unauthenticated -> login page
  authenticated -> myApp

*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:confession_app/home.dart';
import 'package:confession_app/authentication/authentication_page.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot ){
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator.adaptive());
        }

        // check if there is a valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;


        if (session != null) {
          return const MyHome();
        }
        else{
          return LoginPage();
        }
      }
      );
  }
}
