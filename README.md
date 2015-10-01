# Talkr Scenarios
Example scenarios for working with Migrations in SQL Source Control, using the fictional phone company talkr.

### Enabling Migrations

Firstly you will need the to enable the new Migrations features:

1. Update to the latest [SQL Source Control, Frequent Updates](https://www.red-gate.com/products/sql-development/sql-source-control/frequent-updates)
2. Edit the Engine options file: `%LocalAppData%\Red Gate\SQL Source Control 4\RedGate_SQLSourceControl_Engine_EngineOptions.xml`
3. Add the following element: `<UseMigrationBlocks>True</UseMigrationBlocks>`

### Repository & Database Setup

1. Fork this repository.
2. Clone the repository to your development machine.
3. Create a new database in SQL Server: `talkr`.
4. In SQL Source Control:
  1. Go to the Setup tab.
  2. Choose "Link to my source control system".
  3. Choose "Git".
  4. Choose the `database` folder inside the `example-talkr` repo.
  5. Click "Link".
  6. Go to the "Get Latest" tab.
  7. Click "Apply changes to database".

### Database Diagram
The talkr database currently consists of 3 tables (2 static data, 1 transactional), 3 views, and a function:
![Talkr Database Diagram](/images/talkr_db_diagram.png)

### Default Express Shipping

We have a SQL Server database that stores details about our customers, and for each customer, it stores their preference for shipping speed.

There are currently 3 possible options: `1` express, `2` standard, and `NULL` no preference stated.

You have been asked that for customers who currently have no preference stated, their preference should be set to express shipping.

Here's how an example shipping preference is stored in the database before and after the change:

Column              | Before             | After
--------------------|--------------------|-------------------------------
`express_shipping`  | `0` / `1` / `NULL` | `0` / `1` (`NULL` becomes `1`)

###### Instructions
1. Using your source control tool create a branch from `master` called `express-shipping`.
2. Solve the set problem, [or use this SQL](/examples/express-shipping.sql).
3. Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
4. Push to your branch, **but don't merge to yet**.

### Scottish Independence

Following a 'Yes' vote in the Scottish independence referendum, you have been asked to change all the customer addresses in our database who's address is in Scotland.

Here's how an example address is stored in the database before and after the change:

Column              | Before                 | After
--------------------|------------------------|-----------------------
`address_line1`     | 49 Featherstone Street | 49 Featherstone Street
`city`              | Glasgow                | Glasgow
`postcode`          | G9 1DS                 | G9 1DS
`state_code`        | SCT                    |
`country_code`      | UK                     | SC

###### Instructions
1. Using your source control tool create a branch from `master` called `scottish-independence`.
2. Solve the set problem, [or use this SQL](/examples/scottish-independence.sql).
3. Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
4. Push to your branch, **but don't merge to yet**.

### Split Name Column

We have a SQL Server database that stores details about our customers, and for each customer, it stores their title and name.

You have been asked to change the `name` column so that it is split into two new columns, `first_name` & `last_name`.

Here's how an example title and name is stored in the database before and after the change:

Column       | Before          | After
-------------|-----------------|-----------------
`title`      | Mr              | Mr
`name`       | John Smith      | <doesn't exist>
`first_name` | <doesn't exist> | John
`last_name`  | <doesn't exist> | Smith

###### Instructions
1. Using your source control tool create a branch from `master` called `split-name`.
2. Solve the set problem, [or use this SQL](/examples/split-name.sql).
3. Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
4. Push to your branch, **but don't merge to yet**.

### Merging
Now that you have created a few branches we can test merging by bringing all three of these branches onto `master` using your source control and merging tools.
