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
final api = client.account;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple eBank App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 20,
            color: Colors.indigoAccent,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 20,
            color: Colors.indigoAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Simple eBank App'),
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
  Account? account;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login to your account"),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please enter an email and password'),
                            ),
                          );
                          return;
                        }
                        var user = User(
                            email: emailController.text,
                            password: passwordController.text);
                        try {
                          await api.readAllUser().then((value) async {
                            User? u;
                            for (u in value) {
                              if (u.email == user.email &&
                                  u.password == user.password) {
                                break;
                              }
                            }
                            if (u != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User found'),
                                ),
                              );
                              try {
                                await api.readAcc(u.id!).then((value) {
                                  setState(() {
                                    account = value;
                                  });
                                });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.toString()),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User not found'),
                                ),
                              );
                            }
                            emailController.clear();
                            passwordController.clear();
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainScreen(account: account)));
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error signing in user: $e'),
                            ),
                          );
                        }
                        setState(() {
                          this.user = user;
                        });
                      },
                      child: const Text("Sign In")),
                ),

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
            ),
          ),
        ));
  }
}
