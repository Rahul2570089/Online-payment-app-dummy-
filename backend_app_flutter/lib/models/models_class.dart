class UserWithoutName {
  String email;
  String password;
  String pin;
  UserWithoutName({required this.email,required this.password,required this.pin});
}

class AccountWithoutId {
  String id;
  String balance;
  AccountWithoutId({required this.id,required this.balance});
}

class BankAccountsWithoutBalance {
  String name;
  String number;
  BankAccountsWithoutBalance({required this.name, required this.number});
}