import 'package:backend_app_client/backend_app_client.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Account? account;
  const MainScreen({super.key, this.account});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Account number: ${widget.account!.number}"),
            const SizedBox(height: 20),
            Text("Balance: ${widget.account!.balance}"),
          ]
        ),
      )
    );
  }
}
