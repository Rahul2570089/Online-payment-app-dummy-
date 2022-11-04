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
-- Class User as table users
--

CREATE TABLE users (
  "id" serial,
  "email" text NOT NULL,
  "password" text NOT NULL
);

ALTER TABLE ONLY users
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


