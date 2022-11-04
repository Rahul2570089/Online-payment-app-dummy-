import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
final api = client.user;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  User? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter an email and password'),
                      ),
                    );
                    return;
                  }
                  final user = User(
                      email: emailController.text,
                      password: passwordController.text);
                  try {
                    await api.create(user).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User created'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen(user: value)),
                      );
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error creating user: $e'),
                      ),
                    );
                  }
                  setState(() {
                    this.user = user;
                  });
                },
                child: const Text("Create")),

            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     final users = await api.readAll();
            //     setState(() {
            //       user = users.first;
            //     });
            //   },
            //   child: const Text("Read")
            // ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     user!.email = 'ras2570089@gmail.com';
            //     user!.password = '123456789';
            //     final newUser = await api.update(user!);
            //     setState(() {
            //       user = newUser;
            //     });
            //   },
            //   child: const Text("Update")
            // ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     if(user==null) {
            //       return;
            //     }
            //     final id = user!.id;
            //     await api.delete(id!);
            //     setState(() {
            //       user = null;
            //     });
            //   },
            //   child: const Text("Delete")
            // ),
          ],
        ));
  }
}
