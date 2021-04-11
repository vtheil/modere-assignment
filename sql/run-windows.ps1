#!/usr/bin/env pwsh

$env:WORKSPACE="$PSScriptRoot"

cd $env:WORKSPACE

# Start containers
& docker-compose up -d

# Wait for the database to be initialized
echo "Waiting for database to initialize"
sleep 5

# Create Database
& docker-compose exec db bash -c "psql -U postgres -c 'CREATE DATABASE example'"

# Populate the new database
& docker-compose exec db bash -c "psql -U postgres -d example -f /var/lib/postgresql/example/generate_database.sql"

# Export the new content into a csv file
& docker-compose exec db bash -c "psql -U postgres -d example -c '\copy (SELECT customers.id AS customer_id, customers.first_name, customers.last_name, products.id AS product_id, products.product_name, products.price FROM customers JOIN purchases ON customers.id = purchases.customer_id JOIN products ON products.id = purchases.product_id ORDER BY customer_id ASC) TO /var/lib/postgresql/modere/result.csv CSV HEADER'"

# Shutdown the container
& docker-compose down
