create database accounting;

-- example to grant permissions on the database to a specific username
-- this is not needed here since we are the root user
-- grant all on accounting.* to 'user'@'client_host';

use accounting

create table account_types (
  id integer not null,
  description varchar(20) not null,
  primary key (ID)
);

insert into account_types (description) values ('Revenue');
insert into account_types (description) values ('Expense');
insert into account_types (description) values ('Asset');
insert into account_types (description) values ('Liability');
insert into account_types (description) values ('Equity');

create table accounts (
  id integer not null,
  account_number integer not null,
  title varchar(20) not null,
  account_type_id integer not null,
  primary key (ID),
  foreign key (account_type_id) references account_types(id)
);

create table journal_entries (
  id integer not null,
  when_entered timestamp not null default current_timestamp,
  transaction_date date not null,
  primary key (id)
);

create table journal_entry_lins (
  id integer not null,
  journal_entry_id integer not null,
  account_id integer not null,
  amount numeric(10,2),
  description varchar(100),
  primary key (id),
  foreign key (journal_entry_id) references journal_entries(id),
  foreign key (account_id) references accounts(id)
);
