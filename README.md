# Rales Engine
An API for sales data using Sinatra.

## Setup

* Download this project into a working directory.

* Install the requirements using bundle:
> bundle install

  This will install the required gems for the project.

* Create the local database using rake:
> rake db:create

* Rake tasks are written to import CSV data from the data directory. For convinience, the following task will import all data and reset the database tables:
> rake import:all

  Rake tasks to import individual resources are avalible under rake's import namespace.

* To remove Sinatra's built-in warning about ActiveSupport set this environment variable in your terminal:
> export SINATRA_ACTIVESUPPORT_WARNING=false

  This is an optional step.

* **Sinatra has a known bug when using MacOS reguarding fork safety. To run this project on MacOS, set this environment variable.**
> export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

* This project includes the shotgun gem as an alternitive to spring. To use this, start the server with the following command:
> shotgun

* As a Rack based app, you are also able to start the server using the following command:
> rackup

## Endpoints

The following resources are exposed on this API:

<details>
<summary><b>Merchants</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/merchants</b>
<br>
Returns an index of all merchant entries in the database.
<br><br>
<b>/api/vi/merchants/:id</b>
<br>
Returns a representation of an  individual merchant from the database.
<br><br>
<b>/api/vi/merchants/random</b>
<br>
Returns a random individual merchant object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/merchants/find?attribute=x</b>
<br><br>
<b>/api/v1/merchants/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/merchants/:id/items</b>
<br>
Returns a collection of items associated with that merchant.
<br><br>
<b>/api/v1/merchants/:id/invoices</b>
<br>
Returns a collection of invoices associated with that merchant from their known orders.
<br><br>
<b>The following business logic endpoints are exposed:</b>
<br><br>
<b>/api/v1/merchants/most_revenue?quantity=x</b>
<br>
Returns the top x merchants ranked by total revenue.
<br><br>
<b>/api/v1/merchants/most_items?quantity=x</b>
<br>
Returns the top x merchants ranked by total number of items sold.
<br><br>
<b>/api/v1/merchants/revenue?date=x</b>
<br>
Returns the total revenue for date x across all merchants.
<br><br>
<b>/api/v1/merchants/:id/revenue</b>
<br>
Returns the total revenue for that merchant across successful transactions.
<br><br>
<b>/api/v1/merchants/:id/revenue?date=x</b>
<br>
Returns the total revenue for that merchant for a specific invoice date x.
<br><br>
<b>/api/v1/merchants/:id/favorite_customer</b>
<br>
Returns the customer who has conducted the most total number of successful transactions.
<br><br>
<b>/api/v1/merchants/:id/customers_with_pending_invoices</b>
<br>
Returns a collection of customers which have pending (unpaid) invoices.
</details>
<br>
<details>
<summary><b>Items</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/items</b>
<br>
Returns an index of all item entries in the database.
<br><br>
<b>/api/vi/items/:id</b>
<br>
Returns a representation of an  individual item from the database.
<br><br>
<b>/api/vi/items/random</b>
<br>
Returns a random individual item object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/items/find?attribute=x</b>
<br><br>
<b>/api/v1/items/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/items/:id/invoice_items</b>
<br>
Returns a collection of associated invoice items.
<br><br>
<b>/api/v1/items/:id/merchant</b>
<br>
Returns the associated merchant.
<br><br>
<b>The following business logic endpoints are exposed:</b>
<br><br>
<b>/api/v1/items/most_revenue?quantity=x</b>
<br>
Returns the top x items ranked by total revenue generated.
<br><br>
<b>/api/v1/items/most_items?quantity=x</b>
<br>
Returns the top x item instances ranked by total number sold.
<br><br>
<b>/api/v1/items/:id/best_day</b>
<br>
Returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.
</details>
<br>
<details>
<summary><b>Invoices</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/invoices</b>
<br>
Returns an index of all invoice entries in the database.
<br><br>
<b>/api/vi/invoices/:id</b>
<br>
Returns a representation of an  individual invoice from the database.
<br><br>
<b>/api/vi/invoices/random</b>
<br>
Returns a random individual invoice object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/invoices/find?attribute=x</b>
<br><br>
<b>/api/v1/invoices/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/invoices/:id/transactions</b>
<br>
Returns a collection of associated transactions.
<br><br>
<b>/api/v1/invoices/:id/invoices</b>
<br>
Returns a collection of associated invoice items.
<br><br>
<b>/api/v1/invoices/:id/items</b>
<br>
Returns a collection of associated items.
<br><br>
<b>/api/v1/invoices/:id/customer</b>
<br>
Returns the associated customer.
<br><br>
<b>/api/v1/invoices/:id/merchant</b>
<br>
Returns the associated merchant.
</details>
<br>
<details>
<summary><b>Invoice_Items</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/invoice_items</b>
<br>
Returns an index of all invoice_item entries in the database.
<br><br>
<b>/api/vi/invoice_items/:id</b>
<br>
Returns a representation of an  individual invoice_item from the database.
<br><br>
<b>/api/vi/invoice_items/random</b>
<br>
Returns a random individual invoice_item object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/invoice_items/find?attribute=x</b>
<br><br>
<b>/api/v1/invoice_items/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/invoice_items/:id/invoice</b>
<br>
Returns the associated invoice.
<br><br>
<b>/api/v1/invoice_items/:id/item</b>
<br>
Returns the associated item.
</details>
<br>
<details>
<summary><b>Transactions</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/transactions</b>
<br>
Returns an index of all transaction entries in the database.
<br><br>
<b>/api/vi/transactions/:id</b>
<br>
Returns a representation of an  individual transaction from the database.
<br><br>
<b>/api/vi/transactions/random</b>
<br>
Returns a random individual transaction object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/transactions/find?attribute=x</b>
<br><br>
<b>/api/v1/transactions/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/transactions/:id/invoice</b>
<br>
Returns the associated invoice.
</details>
<br>
<details>
<summary><b>Customers</b></summary>
<br>
<b>The following record endpoints are exposed:</b>
<br><br>
<b>/api/v1/customers</b>
<br>
Returns an index of all transaction entries in the database.
<br><br>
<b>/api/vi/customers/:id</b>
<br>
Returns a representation of an  individual transaction from the database.
<br><br>
<b>/api/vi/customers/random</b>
<br>
Returns a random individual transaction object.
<br><br>
These resources also have finders for both singular and all matching records. These are accessed using:
<br><br>
<b>/api/v1/customers/find?attribute=x</b>
<br><br>
<b>/api/v1/customers/find_all?attribute=x</b>
<br><br>
All attributes can be searched, using the same name and format that is recieved from the index page.
<br><br>
<b>The following relationship endpoints are exposed:</b>
<br><br>
<b>/api/v1/customers/:id/invoices</b>
<br>
Returns a collection of associated invoices.
<br><br>
<b>/api/v1/customers/:id/transactions</b>
<br>
Returns a collection of associated transactions.
<br><br>
<b>The following business logic endpoints are exposed:</b>
<br><br>
<b>/api/v1/customers/:id/favorite_merchant</b>
<br>
Returns a merchant where the customer has conducted the most successful transactions.
</details>
