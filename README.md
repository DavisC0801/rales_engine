# Rales Engine
An API for sales data using Sinatra.

## Setup

* Download this project into a working directory.

* Install the requirements using bundle:
> bundle install

  This will install the required gems for the project.

* Create the local database using rake:
> rake db:create

* Run the import task if using default data. This will use CSV files stored in the data directory:
> rake import:all

  This will also reset the tables and re-run migrations. Individual rake tasks to import files exist under rake's import namespace.

* To remove Sinatra's built-in warning about ActiveSupport set this enviornment variable in your terminal:
> export SINATRA_ACTIVESUPPORT_WARNING=false

  This is an optional step.

* **Sinatra has a known bug when using MacOS reguarding fork safety. To run this project on MacOS, set this enviornment variable.**
> export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

* This project includes the shotgun gem as an alternitive to spring. To use this, start the server with the following command:
> shotgun

* As a Rack based app, you are also able to start the server using the following command:
> rackup

## Endpoints

The following resources are exposed on this API:
Off the Rails - Using Sinatra to create an API

* Merchants
* Items
* Invoices
* Invoice_Items
* Transactions
* Customers

### All resources have the following record endpoints exposed:
> /api/v1/resource

  This is an index of all resource entries.

> /api/vi/resource/:id

  This is an individual resource.

> /api/v1/resource/random

  This will find a random individual resource.

These resources also have finders for both singular and all matching records. These are accessed using:
> /api/v1/resource/find?attribute=x

> /api/v1/resource/find_all?attribute=x

  All attributes can be searched, using the same name and format that is recieved from the index page.

### These resources have the following relationship endpoints that are exposed:

* Merchants
> /api/v1/merchants/:id/items 

  Returns a collection of items associated with that merchant.
  
> /api/v1/merchants/:id/invoices 

  Returns a collection of invoices associated with that merchant from their known orders.

* Invoices

> /api/v1/invoices/:id/transactions 

  Returns a collection of associated transactions.
> /api/v1/invoices/:id/invoice_items 

  Returns a collection of associated invoice items.
> /api/v1/invoices/:id/items 

  Returns a collection of associated items.
> /api/v1/invoices/:id/customer 

  Returns the associated customer.
> /api/v1/invoices/:id/merchant 

  Returns the associated merchant.

Invoice Items

> /api/v1/invoice_items/:id/invoice 

  Returns the associated invoice.
> /api/v1/invoice_items/:id/item 

  Returns the associated item.

Items

> /api/v1/items/:id/invoice_items 

  Returns a collection of associated invoice items.
> /api/v1/items/:id/merchant 

  Returns the associated merchant.

Transactions

> /api/v1/transactions/:id/invoice 

  Returns the associated invoice.

Customers

> /api/v1/customers/:id/invoices 

  Returns a collection of associated invoices.
> /api/v1/customers/:id/transactions 

  Returns a collection of associated transactions.

### These resources have the following business logic endpoints exposed:

* Merchants

> /api/v1/merchants/most_revenue?quantity=x 

  Returns the top x merchants ranked by total revenue.
> /api/v1/merchants/most_items?quantity=x 

  Returns the top x merchants ranked by total number of items sold.
> /api/v1/merchants/revenue?date=x 

  Returns the total revenue for date x across all merchants.
> /api/v1/merchants/:id/revenue 

  Returns the total revenue for that merchant across successful transactions.
> /api/v1/merchants/:id/revenue?date=x 

  Returns the total revenue for that merchant for a specific invoice date x.
> /api/v1/merchants/:id/favorite_customer 

  Returns the customer who has conducted the most total number of successful transactions..
> /api/v1/merchants/:id/customers_with_pending_invoices 

  Returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help..

* Items

> /api/v1/items/most_revenue?quantity=x 

  Returns the top x items ranked by total revenue generated.
> /api/v1/items/most_items?quantity=x 

  Returns the top x item instances ranked by total number sold.
> /api/v1/items/:id/best_day 

  Returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day..

* Customers

> /api/v1/customers/:id/favorite_merchant 

  Returns a merchant where the customer has conducted the most successful transactions.
