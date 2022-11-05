import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main.dart';
import 'package:backend_app_flutter/transaction_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Account? account;
  const MainScreen({super.key, this.account});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  String formatDate =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple eBank App'),
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
                              Text("Account number: "),
                              SizedBox(height: 20),
                              Text("Balance: "),
                            ],
                          ),
                          const SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      controller: numberController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Account number',
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
                                    onPressed: () async {
                                      final receiver = Account(
                                          number: numberController.text,
                                          balance: balanceController.text);

                                      if (numberController.text.isEmpty ||
                                          balanceController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please enter account number and amount'),
                                          ),
                                        );
                                        return;
                                      }

                                      try {
                                        await api
                                            .readAllAcc()
                                            .then((value) async {
                                          Account? a;
                                          for (a in value) {
                                            if (a.number == receiver.number) {
                                              break;
                                            }
                                          }
                                          if (a != null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text('Account found'),
                                                duration:
                                                    Duration(microseconds: 5),
                                              ),
                                            );
                                            a.balance = (int.parse(a.balance) +
                                                    int.parse(receiver.balance))
                                                .toString();

                                            widget.account
                                                ?.balance = (int.parse(widget
                                                        .account!.balance) -
                                                    int.parse(receiver.balance))
                                                .toString();

                                            if (int.parse(
                                                    widget.account!.balance) <
                                                0) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Insufficient balance'),
                                                ),
                                              );
                                              return;
                                            }

                                            final updatedReceiver =
                                                await api.updateAcc(a);
                                            Account? a1;
                                            for (a1 in value) {
                                              if (a1.number ==
                                                  widget.account!.number) {
                                                break;
                                              }
                                            }
                                            a1 = updatedReceiver;
                                            final updatedSender = await api
                                                .updateAcc(widget.account!);
                                            setState(() {
                                              widget.account?.balance =
                                                  updatedSender.balance;
                                            });
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Transaction successful'),
                                              ),
                                            );
                                            final transaction = Transactions(
                                                sender: widget.account!.number,
                                                receiver: receiver.number,
                                                amount: balanceController.text,
                                                date: formatDate);
                                            await api.createTrans(transaction);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Account not found'),
                                              ),
                                            );
                                          }
                                        });
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Error: ${e.toString()}'),
                                          ),
                                        );
                                      }
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context2).pop();
                                    },
                                    child: const Text('Send'),
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
