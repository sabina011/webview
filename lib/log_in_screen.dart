import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'authenticated_screen.dart';

class LoginScreen extends StatelessWidget {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Simulate successful login
            await saveCredentials("user123");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthenticatedScreen()),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }

  Future<void> saveCredentials(String username) async {
    await storage.write(key: 'username', value: username);
  }
}
