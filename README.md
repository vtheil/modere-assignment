# Postgres Example

This example uses a Postgres docker container as the SQL database. The SQL code found in `sql/generate_database.sql` has also been tested with MySQL.

## Requirements
| App    | Notes                                                                               | URL                                            |
| ------ | ----------------------------------------------------------------------------------- | ---------------------------------------------- |
| Docker | Docker is required for running postgres in an isolated and reproducable environment | https://www.docker.com/products/docker-desktop |


## How to run

All scripts for creating a database and exporting a csv file can be found in the `sql` directory. The simplest way is to generate the csv file is to run one of the `run` scripts in the `sql` directory
```
sql
├── run-macos.command
└── run-windows.ps1
```

The scripts should be double clickable to run, however, if this does not work, follow the following steps.

Note: For windows, you may need to right click `sql/run-windows.ps1` and select "Run with PowerShell"

1. Open a terminal/powershell window
2. In this window, type `cd <place to downloaded attachment>`
   * Note that `<place to downloaded attachment>` is the location of the assignment
3. Next run the script
   * For MacOS: `./sql/run-macos.command`
   * For Windows: `./sql/run-windows.ps1` 

This should generate the sql file.
