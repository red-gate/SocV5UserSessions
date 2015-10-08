# Setting up the Talkr scenarios
These instructions explain how to set up the scenarios for using migration scripts in SQL Source Control. They use the fictional phone company Talkr.

## Enable the migrations alpha

For instructions on how to turn the alpha on, see [this page](MigrationsInstallInstructions.md).

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

## Create the databases for each scenario

TODO: Creating the databases, linking them to source control, and creating the branches. 

## What's next?

For instructions on how to run through the scenarios, see [this page](README.md).