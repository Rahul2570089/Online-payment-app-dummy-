--
-- Class Account as table accounts
--

CREATE TABLE accounts (
  "id" serial,
  "number" text NOT NULL,
  "balance" text NOT NULL
);

ALTER TABLE ONLY accounts
  ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


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
  "email" text NOT NULL,
  "password" text NOT NULL
);

ALTER TABLE ONLY users
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


