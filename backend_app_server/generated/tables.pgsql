--
-- Class Account as table accounts
--

CREATE TABLE accounts (
  "id" serial,
  "holderid" text NOT NULL,
  "number" text NOT NULL,
  "balance" text NOT NULL
);

ALTER TABLE ONLY accounts
  ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Class BankAccounts as table bankaccounts
--

CREATE TABLE bankaccounts (
  "id" serial,
  "name" text NOT NULL,
  "accountNumber" text NOT NULL,
  "accountType" text NOT NULL,
  "balance" text NOT NULL
);

ALTER TABLE ONLY bankaccounts
  ADD CONSTRAINT bankaccounts_pkey PRIMARY KEY (id);


--
-- Class Transactions as table transactions
--

CREATE TABLE transactions (
  "id" serial,
  "sender" text NOT NULL,
  "receiver" text NOT NULL,
  "amount" text NOT NULL,
  "date" text NOT NULL
);

ALTER TABLE ONLY transactions
  ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Class User as table users
--

CREATE TABLE users (
  "id" serial,
  "name" text NOT NULL,
  "email" text NOT NULL,
  "password" text NOT NULL,
  "pin" text NOT NULL
);

ALTER TABLE ONLY users
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


