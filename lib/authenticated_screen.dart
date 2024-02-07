import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'log_in_screen.dart';

class AuthenticatedScreen extends StatelessWidget {
  final storage = const FlutterSecureStorage();

  const AuthenticatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticated Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Logout
            await logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('Logout'),
        ),
      ),
    );
  }

  Future<void> logout() async {
    await storage.delete(key: 'username');
  }
}
