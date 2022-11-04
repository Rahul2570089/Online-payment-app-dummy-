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


