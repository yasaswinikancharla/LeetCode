Select name as Customers
from Customers 
where id Not in (Select customerId from Orders)
