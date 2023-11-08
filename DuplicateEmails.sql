Select email as Email
from Person
Group by email
Having count(email) >=2
