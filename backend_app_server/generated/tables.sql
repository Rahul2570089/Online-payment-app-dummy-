-- --
-- -- Class Account as table accounts
-- --

-- CREATE TABLE accounts (
--   "id" serial,
--   "number" text NOT NULL,
--   "balance" text NOT NULL
-- );

-- ALTER TABLE ONLY accounts
--   ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


-- --
-- -- Class User as table users
-- --

-- CREATE TABLE users (
--   "id" serial,
--   "email" text NOT NULL,
--   "password" text NOT NULL
-- );

-- ALTER TABLE ONLY users
--   ADD CONSTRAINT users_pkey PRIMARY KEY (id);

INSERT INTO users (id, email, password) VALUES (2, 'xyz@gmail.com', '7891011');
INSERT INTO accounts (id, number, balance) VALUES (2, '87654321', '50000');


