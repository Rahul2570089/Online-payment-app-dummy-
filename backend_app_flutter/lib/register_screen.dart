import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main.dart';
import 'package:backend_app_flutter/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("oPay UPI App"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Sign Up',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: numberController,
                  validator: (value) {
                    if (value!.length != 9) {
                      return 'Please enter a valid account number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Account Number of your bank',
                    border: OutlineInputBorder(),
                  ),
                ),
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
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool check = false;

                        String currentUserId = emailController.text.split('@')[0];
                        await api.readAllAcc().then((value) {
                          for (var i in value) {
                            if (i.number == numberController.text || i.holderid == '$currentUserId@upi') {
                              check = true;
                              break;
                            }
                          }
                        });
                        if (check) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Account already exists. Please try again.'),
                            ),
                          );
                          return;
                        }
                        showDialog(
                            context: context,
                            builder: (context2) {
                              return SizedBox(
                                width: double.infinity,
                                child: SimpleDialog(
                                    title: const Text('Create PIN'),
                                    insetPadding: EdgeInsets.zero,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: PinCodeTextField(
                                          appContext: context2,
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
                                              try {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  final newUser = User(
                                                      name: nameController.text,
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                      pin: pinController.text);

                                                  await api
                                                      .createUser(newUser)
                                                      .then((value) async {
                                                    String id = emailController
                                                        .text
                                                        .split('@')[0];
                                                    final newAccount = Account(
                                                      holderid: '$id@upi',
                                                      number:
                                                          numberController.text,
                                                      balance: '1000',
                                                    );
                                                    await api
                                                        .createAcc(newAccount)
                                                        .then((value) => {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                      'Account created successfully.'),
                                                                ),
                                                              ),
                                                              Navigator.of(
                                                                      context)
                                                                  .pushReplacement(
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen(
                                                                    account:
                                                                        newAccount,
                                                                    name: newUser
                                                                        .name,
                                                                  ),
                                                                ),
                                                              ),
                                                            });
                                                  });
                                                }
                                              } on Exception catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(e.toString()),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                              );
                            });
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Already have an account?'),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
