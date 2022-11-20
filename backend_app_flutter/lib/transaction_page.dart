import 'package:backend_app_client/backend_app_client.dart';
import 'package:backend_app_flutter/main.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final Account? account;
  const TransactionScreen({super.key, this.account});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  Future<List<Transactions>> fetchTransactions() async {
    final transactions = await api.readAllTrans();
    List<Transactions> transactionsList = [];
    for (var i in transactions) {
      if (i.sender == widget.account!.holderid) {
        transactionsList.add(Transactions(
          id: i.id,
          sender: i.sender,
          receiver: i.receiver,
          amount: '-₹${i.amount}',
          date: i.date,
        ));
      } else if (i.receiver == widget.account!.holderid) {
        transactionsList.add(Transactions(
          id: i.id,
          sender: i.sender,
          receiver: i.receiver,
          amount: '+₹${i.amount}',
          date: i.date,
        ));
      }
    }
    return transactionsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transactions>>(
      future: fetchTransactions(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Transactions'),
            ),
            body: snapshot.hasData
                ? ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final transaction = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(221, 202, 194, 194),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListTile(
                            title: SizedBox(
                                child: Row(
                              children: [
                                Text(transaction.date),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: transaction.amount[0] == '-'
                                            ? const Text("Sender:  ")
                                            : const Text("Receiver:  "),
                                      ),
                                      Text(
                                          transaction.amount[0] == '-'
                                              ? transaction.receiver
                                              : transaction.sender,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                            trailing: Text(
                              transaction.amount,
                              style: TextStyle(
                                  color: transaction.amount[0] == '-'
                                      ? Colors.red
                                      : Colors.green),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: Text("No transactions")),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
