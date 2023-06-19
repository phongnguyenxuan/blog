import 'package:blog/responsive/mobile_layout.dart';
import 'package:blog/responsive/responsive_layout.dart';
import 'package:blog/responsive/web_layout.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends StatefulWidget {
  const AuthState({super.key});
  static const String id = "main";

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  const ResponsiveLayout(
            mobileLayout: MobileLayout(),
            webLayout: WebLayout(),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
