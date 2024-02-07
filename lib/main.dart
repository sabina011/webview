import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'authenticated_screen.dart';
import 'log_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Login Demo',
      home: FutureBuilder<String?>(
        future: getCredentials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              return AuthenticatedScreen();
            } else {
              return LoginScreen();
            }
          }
        },
      ),
    );
  }

  Future<String?> getCredentials() async {
    return await storage.read(key: 'username');
  }
}
