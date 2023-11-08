Select e1.name as Employee
from Employee as e1 inner join Employee as e2
on e1.managerid =e2.id where e1.salary> e2.salary
