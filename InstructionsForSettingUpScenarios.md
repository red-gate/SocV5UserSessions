# Setting up the Talkr scenarios
These instructions explain how to set up and run through scenarios for using migration scripts in SQL Source Control. They use the fictional phone company Talkr.

## Enable the migrations alpha

1. Turn on [Frequent Updates](http://documentation.red-gate.com/display/SOC4/Turning+on+Frequent+Updates)
- Update to the latest SQL Source Control version.
- Go to the SQL Source Control config files folder. By default, this is located at `%LocalAppData%\Red Gate\SQL Source Control 4\/`
- Open `RedGate_SQLSourceControl_Engine_EngineOptions.xml` in a text editor.
- Inside the `<EngineOptions>` tags, add: `<UseMigrationBlocks>True</UseMigrationBlocks>`
- Ignoring any comments (or other lines you may have added), the final file should look like this:
```xml
<EngineOptions version="3" type="EngineOptions">
	<UseMigrationBlocks>True</UseMigrationBlocks>
</EngineOptions>
```
- Restart SQL Server Management Studio.

## Set up the repository

You need to set up the repository to get the example database and scripts. 

To do this, on your local machine, use Git to clone this repository (https://github.com/MightyAx/example-talkr).

## Set up the database

1. In SQL Server Management Studio, create a new database named `talkr-master`.
- In the Object Explorer, select the database.
- Select the database.
- Open SQL Source Control:
  1. Go to the Setup tab.
  - Select "Link to my source control system".
  - Select "Git".
  - Browse to the `database` folder inside the `example-talkr` repository you cloned.
  - Click "Link".
  - Go to the "Get Latest" tab.
  - Click "Apply changes to database".
- Insert the data into the database by [running this script](/examples/data.sql)

## About the Talkr database
The Talkr database consists of 3 tables (2 static data, 1 transactional), 3 views, and a function:
![Talkr Database Diagram](/images/talkr_db_diagram.png)

## The migrations scenarios

### 1: default express shipping

In the Customers table, the express_shipping column stores their preference for shipping speed.

There are currently 3 possible options: `1` express, `0` standard, and `NULL` no preference stated.

Your task: for customers who have no preference stated, set the preference to express shipping.

Here's an example of how shipping preference is stored in the database before and after the change:

Column              | Before             | After
--------------------|--------------------|-------------------------------
`express_shipping`  | `0` / `1` / `NULL` | `0` / `1` (`NULL` becomes `1`)

###### Instructions
1. Using Git, create a branch from `master` called `express-shipping`.
- Use the Database Setup instructions above but name it `talkr-express-shipping`
- Solve the above problem, [or use this SQL](/examples/express-shipping.sql).
- Use the migrations tab in SQL Source Control to create a migration script covering your change.
- Commit your migration script.
- Push to your branch, **don't merge to master yet**.
- Switch to the `master` branch.

### Scottish Independence

Following a 'Yes' vote in the Scottish independence referendum, you have been asked to change all the customer addresses in our database whose address is in Scotland.

Here's how an example address is stored in the database before and after the change:

Column              | Before                 | After
--------------------|------------------------|-----------------------
`address_line1`     | 49 Featherstone Street | 49 Featherstone Street
`city`              | Glasgow                | Glasgow
`postcode`          | G9 1DS                 | G9 1DS
`state_code`        | SCT                    |
`country_code`      | UK                     | SC

###### Instructions
1. Create a branch from `master` called `scottish-independence`.
- Use the Database Setup instructions above but name it `talkr-scottish-independence`
- Solve the above problem, [or use this SQL](/examples/scottish-independence.sql).
- Use the migrations tab in SQL Source Control to create a migration script covering your change.
- Commit your migration script.
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
1.Create a branch from `master` called `split-name`.
- Use the Database Setup instructions above but name it `talkr-split-name`
- Solve the above problem, [or use this SQL](/examples/split-name.sql).
- Use the migrations tab in SQL Source Control to create a migration script covering your change.
- Commit your migration script.
- Push to your branch, **don't merge to master yet**.
- Switch to the `master` branch.

### Merging
Now that you have created a few branches we can test merging by bringing all three of these branches onto `master`.
###### Instructions
1. You can use source tree or your preferred tool of choice to merge each of the three branches: `express-shipping`, `scottish-independence` and `split-name`.
- When merging you will have conflicts, such as:
  1. `DeploymentOrder.json`, this file will often conflict when merging branches with migration scripts. In general you want to take both. You can find for more help [here](www.red-gate.com/SOC4/order-file-more-info).
  - `this.compare.empty-to-end-of-block.patch` This file should describe the end state after both changes you are merging.  This conflict may be removed in future versions.
- Push your commits to `master`
