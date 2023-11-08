Select b.id 
from Weather a 
inner join Weather b on Datediff(day,a.recordDate,b.recordDate) =1 and a.temperature < b.temperature
