
import 'package:flutter/material.dart';

/// Authentication main page
class AuthScreen extends StatelessWidget {
  /// Default constructor for [AuthScreen] widget
  const AuthScreen({super.key});

  /// Named route for [AuthScreen]
  static const String route = 'auth';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SignInWithGoogleButton()),
    );
  }
}
