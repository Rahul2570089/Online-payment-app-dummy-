import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main.dart';
import 'package:backend_app_flutter/models/models_class.dart';
import 'package:backend_app_flutter/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MainScreen extends StatefulWidget {
  final Account? account;
  final String? name;
  const MainScreen({super.key, this.account, this.name});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  String formatDate =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';

  void sendMoney() async {
    final receiver = AccountWithoutId(
        id: idController.text, balance: balanceController.text);

    if (idController.text.isEmpty || balanceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter account id and amount'),
        ),
      );
      return;
    }

    try {
      await api.readAllAcc().then((value) async {
        Account? a;
        for (a in value) {
          if (a.holderid == receiver.id) {
            break;
          }
        }
        if (a != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account found'),
              duration: Duration(microseconds: 5),
            ),
          );
          a.balance =
              (int.parse(a.balance) + int.parse(receiver.balance)).toString();

          widget.account?.balance =
              (int.parse(widget.account!.balance) - int.parse(receiver.balance))
                  .toString();

          if (int.parse(widget.account!.balance) < 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Insufficient balance'),
              ),
            );
            return;
          }

          final updatedReceiver = await api.updateAcc(a);
          Account? a1;
          for (a1 in value) {
            if (a1.id == widget.account!.id) {
              break;
            }
          }
          a1 = updatedReceiver;
          final updatedSender = await api.updateAcc(widget.account!);
          setState(() {
            widget.account?.balance = updatedSender.balance;
          });
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Transaction successful'),
            ),
          );
          final transaction = Transactions(
              sender: widget.account!.holderid,
              receiver: receiver.id,
              amount: balanceController.text,
              date: formatDate);
          await api.createTrans(transaction);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account not found'),
            ),
          );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('oPay UPI App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Name: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text("UPI id: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text("Account id: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text("Balance: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name!),
                              const SizedBox(height: 20),
                              Text(widget.account!.holderid),
                              const SizedBox(height: 20),
                              Text(widget.account!.number),
                              const SizedBox(height: 20),
                              Text('₹${widget.account!.balance}'),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context2) {
                              return AlertDialog(
                                title: const Text('Send money'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: idController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'UPI id',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: balanceController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Amount',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context2).pop();
                                      showDialog(
                                          context: context,
                                          builder: ((context3) {
                                            return SizedBox(
                                              width: double.infinity,
                                              child: SimpleDialog(
                                                  title: const Text('Enter PIN'),
                                                  insetPadding: EdgeInsets.zero,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                      child: PinCodeTextField(
                                                        appContext: context3,
                                                        autoFocus: true,
                                                        length: 6,
                                                        obscureText: true,
                                                        obscuringCharacter: '•',
                                                        animationType:
                                                            AnimationType.fade,
                                                        pinTheme: PinTheme(
                                                          shape: PinCodeFieldShape
                                                              .box,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          fieldHeight: 40,
                                                          fieldWidth: 35,
                                                          activeFillColor:
                                                              Colors.white,
                                                        ),
                                                        onChanged: (value) {
                                                            setState(() {
                                                              pinController.text =
                                                                value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: SizedBox(
                                                        child: IconButton(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          splashRadius: 20,
                                                          icon: const Icon(Icons.check),
                                                          onPressed: () {
                                                            if(pinController.text.length == 6){
                                                              sendMoney();
                                                              Navigator.of(context3).pop();
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                            );
                                          }));
                                    },
                                    child: const Text('Continue'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text('Send money'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TransactionScreen(account: widget.account)));
                      },
                      child: const Text('View transactions'),
                    ),
                  )
                ]),
          ),
        ));
  }
}
