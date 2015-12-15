# The Talkr scenarios
These instructions explain how to run through scenarios for using migration scripts in SQL Source Control. They use the fictional phone company Talkr.

## The scenarios

### 1: Change a state to a country

Let's assume Scotland voted for independence. Your task: update the addresses for all the customers who live in Scotland.

Here's how an example address is stored in the database before and after the change:

Column              | Before                 | After
--------------------|------------------------|-----------------------
`address_line1`     | 49 Featherstone Street | 49 Featherstone Street
`city`              | Glasgow                | Glasgow
`postcode`          | G9 1DS                 | G9 1DS
`state_code`        | SCT                    |
`country_code`      | UK                     | SC

#### Instructions

1. Using Git, create a branch from `master` called `scottish-independence`.
- In SQL Server Management Studio, in the Object Explorer, select the database `talkr-scottish-independence`.
- In the Customers table, for customers whose `state_code` is `SCT`, change the `state_code` to `NULL` and the `country_code` to `SC`. You can use [this SQL script](https://raw.githubusercontent.com/red-gate/SocV5UserSessions/master/examples/scottish-independence.sql) if you like.
- In SQL Source Control, open the Migrations tab, and create a migration script to cover the change.
- Commit the migration script. (*Don't* push your changes.)
- In Git, switch to the `master` branch.

### 2: Set shipping to express by default

In the Customers table, the express_shipping column stores their preference for shipping speed. There are 3 options: `1` express, `0` standard, and `NULL` no preference stated.

Your task: remove the `NULL` option. So for customers who have no preference stated, set the preference to express shipping (`1`).

Here's an example of how shipping preference is stored in the database before and after the change:

Column              | Before             | After
--------------------|--------------------|-------------------------------
`express_shipping`  | `0` / `1` / `NULL` | `0` / `1` (`NULL` becomes `1`)

#### Instructions

1. Using Git, create a branch from `master` called `express-shipping`.
- In SQL Server Management Studio, in the Object Explorer, select the database `talkr-express-shipping`.
- In the Customers table, in the express_shipping column, make the column `NOT NULL`. If the value is currently `NULL`, set it to `1`. You can use [this SQL script](https://raw.githubusercontent.com/red-gate/SocV5UserSessions/master/examples/express-shipping.sql) if you like. 
- In SQL Source Control, open the Migrations tab, and create a migration script to cover the change.
- Commit the migration script.  (*Don't* push your changes.)
- In Git, switch to the `master` branch.

### Merging

We'd like you to test merging with migration scripts. Using Git, merge all the branches you created into master.

