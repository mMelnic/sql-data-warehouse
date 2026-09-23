/*
===========================================================
CREATE DATABASE AND SCHEMAS
===========================================================
Script purpose:
	This script creates a new database named 'DataWarehouse' after checking whether it already exists.
	If the database exists then it is dropped and recreated. The script creates three schrmas within
	the database: 'bronze', 'silver', 'gold'.

WARNING:
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution
	and use proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
