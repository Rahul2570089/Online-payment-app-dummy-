import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main_screen.dart';
import 'package:backend_app_flutter/models/models_class.dart';
import 'package:backend_app_flutter/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
      title: 'oPay UPI App',
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Account? account;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("oPay UPI App"),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Login to your account"),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    enableSuggestions: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // PinCodeTextField(
                  //   appContext: context,
                  //   autoFocus: true,
                  //   length: 6,
                  //   obscureText: true,
                  //   obscuringCharacter: '•',
                  //   animationType: AnimationType.fade,
                  //   pinTheme: PinTheme(
                  //     shape: PinCodeFieldShape.box,
                  //     borderRadius: BorderRadius.circular(5),
                  //     fieldHeight: 40,
                  //     fieldWidth: 60,
                  //     activeFillColor: Colors.white,
                  //   ),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       pinController.text = value;
                  //     });
                  //   },
                  // ),
                  // TextFormField(
                  //   controller: pinController,
                  //   inputFormatters: [
                  //     LengthLimitingTextInputFormatter(6)
                  //   ],
                  //   validator: (value) {
                  //     if (value!.contains(RegExp(r'[a-zA-Z]'))) {
                  //       return 'Please enter a valid pin';
                  //     }
                  //     return null;
                  //   },
                  //   obscureText: true,
                  //   enableSuggestions: false,
                  //   autocorrect: false,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     labelText: '6-digit PIN',
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context2) {
                                  return SimpleDialog(
                                    title: const Text("Enter PIN"),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: PinCodeTextField(
                                          appContext: context,
                                          autoFocus: true,
                                          length: 6,
                                          obscureText: true,
                                          obscuringCharacter: '•',
                                          animationType: AnimationType.fade,
                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.box,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            fieldHeight: 40,
                                            fieldWidth: 35,
                                            activeFillColor: Colors.white,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              pinController.text = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          child: IconButton(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            splashRadius: 20,
                                            icon: const Icon(Icons.check),
                                            onPressed: () async {
                                              if (pinController.text.length ==
                                                  6) {
                                                var user = UserWithoutName(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    pin: pinController.text);
                                                try {
                                                  await api
                                                      .readAllUser()
                                                      .then((value) async {
                                                    User? u;
                                                    for (u in value) {
                                                      if (u.email ==
                                                              user.email &&
                                                          u.password ==
                                                              user.password &&
                                                          u.pin == user.pin) {
                                                        break;
                                                      }
                                                    }
                                                    if (u != null) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'User found'),
                                                        ),
                                                      );
                                                      try {
                                                        await api
                                                            .readAcc(u.id!)
                                                            .then((value) {
                                                          setState(() {
                                                            account = value;
                                                          });
                                                        });
                                                      } catch (e) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                e.toString()),
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'User not found'),
                                                        ),
                                                      );
                                                    }
                                                    emailController.clear();
                                                    passwordController.clear();
                                                    pinController.clear();
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.of(context2)
                                                        .pop();
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MainScreen(
                                                                      account:
                                                                          account,
                                                                      name: u!
                                                                          .name,
                                                                    )));
                                                  });
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Error signing in user: $e'),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text("Sign In")),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text("Sign Up")),
                  )

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
          ),
        ));
  }
}
