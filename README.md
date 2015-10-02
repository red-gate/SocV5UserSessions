# Talkr Scenarios
Example scenarios for working with Migrations in SQL Source Control, using the fictional phone company talkr.

### Enabling Migrations

Firstly you will need the to enable the new Migrations features:

1. Turn on [Frequent Updates](http://documentation.red-gate.com/display/SOC4/Turning+on+Frequent+Updates)
- Update to the latest SQL Source Control version.
- Edit the Engine options file: `%LocalAppData%\Red Gate\SQL Source Control 4\RedGate_SQLSourceControl_Engine_EngineOptions.xml`
- Inside the <EngineOptions> tags, add: `<UseMigrationBlocks>True</UseMigrationBlocks>`
- Ignoring any comments (or other lines you may have added), the final file should look like this:
```xml
<EngineOptions version="4" type="EngineOptions">
	<UseMigrationBlocks>True</UseMigrationBlocks>
</EngineOptions>
```

### Repository & Database Setup

1. Fork this repository.
- Clone the repository to your development machine.
- Create a new database in SQL Server: `talkr`.
- Select the newly created `talkr` database.
- In SQL Source Control:
  1. Go to the Setup tab.
  - Choose "Link to my source control system".
  - Choose "Git".
  - Browse to the `database` folder inside your `example-talkr` repo.
  - Click "Link".
  - Go to the "Get Latest" tab.
  - Click "Apply changes to database".

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
1. Create a branch from `master` called `express-shipping`.
- Solve the above problem, [or use this SQL](/examples/express-shipping.sql).
- Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
- Push to your branch, **don't merge to master yet**.
- Switch to the `master` branch.

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
1. Start with a new database, see Repository & Database Setup for linking the database.
- Create a branch from `master` called `express-shipping`.
- Solve the above problem, [or use this SQL](/examples/scottish-independence.sql).
- Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
- Push to your branch, **don't merge to master yet**.
- Switch to the `master` branch.

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
1. Start with a new database, see Repository & Database Setup for linking the database.
- Create a branch from `master` called `express-shipping`.
- Solve the above problem, [or use this SQL](/examples/split-name.sql).
- Use the migrations tab in SQL Source Control to create and commit a migration script covering your change.
- Push to your branch, **don't merge to master yet**.
- Switch to the `master` branch.

### Merging
Now that you have created a few branches we can test merging by bringing all three of these branches onto `master`.
###### Instructions
1. You can use source tree or your preferred tool of choice to merge each of the three branches: `express-shipping`, `scottish-independence` and `split-name`.
- When merging you may have conflicts, such as:
  1. `DeploymentOrder.json`, this file will often conflict when merging branches with migration scripts. In general you want to take both. You can find for more help [here](www.red-gate.com/SOC4/order-file-more-info).
  - `this.compare.empty-to-end-of-block.patch` This file should describe the end state after both changes you are merging.  This conflict may be removed in future versions.
- Push your commits to `master`
