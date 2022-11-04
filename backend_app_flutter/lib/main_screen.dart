import 'package:backend_app_client/backend_app_client.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final User? user;
  const MainScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Demo'),
      ),
      body: Center(
        child: Text(user!.email),
      ),
    );
  }
}