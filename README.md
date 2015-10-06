# The Talkr scenarios
These instructions explain how to run through scenarios for using migration scripts in SQL Source Control. They use the fictional phone company Talkr.

## About the Talkr database
The Talkr database consists of 3 tables (2 static data, 1 transactional), 3 views, and a function:
![Talkr Database Diagram](/images/talkr_db_diagram.png)

## The scenarios

### 1: default express shipping

In the Customers table, the express_shipping column stores their preference for shipping speed.

There are currently 3 possible options: `1` express, `0` standard, and `NULL` no preference stated.

Your task: for customers who have no preference stated, set the preference to express shipping.

Here's an example of how shipping preference is stored in the database before and after the change:

Column              | Before             | After
--------------------|--------------------|-------------------------------
`express_shipping`  | `0` / `1` / `NULL` | `0` / `1` (`NULL` becomes `1`)

#### Instructions

1. Using Git, create a branch from `master` called `express-shipping`.
- In SQL Server Management Studio, in the Object Explorer, select the database `talkr-express-shipping`.
- In the Customers table, for customers who have no preference stated, set the preference to express shipping. You can use [this SQL script](/examples/express-shipping.sql) if you like. 
- In SQL Source Control, open the migrations tab, and create a migration script to cover the change.
- Commit the migration script.
- Push to your branch. **Don't merge to master yet**. (Is this needed?)
- In Git, switch to the `master` branch.

### 2: change a state to a country

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
- In SQL Server Management Studio, in the Object Explorer, select the database `talkr-scottish-independence`
- In the Customers table, for customers whose address is in Scotland, change the state code to null and the country code to SC. You can use [this SQL script](/examples/scottish-independence.sql) if you like.
- In SQL Source Control, open the migrations tab, and create a migration script to cover the change.
- Commit the migration script.
- Push to your branch. **Don't merge to master yet**. (Is this needed?)
- In Git, switch to the `master` branch.

### 3: split a column

Your task: in the Customers table, split the `name` column into two new columns, `first_name` & `last_name`.

Here's how an example title and name is stored in the database before and after the change:

Column       | Before          | After
-------------|-----------------|-----------------
`title`      | Mr              | Mr
`name`       | John Smith      | <doesn't exist>
`first_name` | <doesn't exist> | John
`last_name`  | <doesn't exist> | Smith

#### Instructions

1. Using Git, create a branch from `master` called `split-name`.
- In SQL Server Management Studio, in the Object Explorer, select the database `talkr-split-name`
- In the Customers table, split the name column into first_name and last_name. You can use [this SQL script](/examples/split-name.sql) if you like.
- In SQL Source Control, open the migrations tab, and create a migration script to cover the change.
- Commit the migration script.
- Push to your branch. **Don't merge to master yet**. (Is this needed?)
- In Git, switch to the `master` branch.

### Merging

We'd like you to test merging with migration scripts. Using Git, merge all the branches you created into master.

#### Instructions
1. You can use source tree or your preferred tool of choice to merge each of the three branches: `express-shipping`, `scottish-independence` and `split-name`.
- When merging you will have conflicts, such as:
  1. `DeploymentOrder.json`, this file will often conflict when merging branches with migration scripts. In general you want to take both. You can find for more help [here](www.red-gate.com/SOC4/order-file-more-info).
  - `this.compare.empty-to-end-of-block.patch` This file should describe the end state after both changes you are merging.  This conflict may be removed in future versions.
- Push your commits to `master`
