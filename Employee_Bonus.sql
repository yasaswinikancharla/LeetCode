select Employee.name, Bonus.bonus 
from Employee 
full outer join Bonus 
on Employee.empId= Bonus.empId
where Bonus.bonus <1000 or bonus.bonus is null
