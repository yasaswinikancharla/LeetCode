select coalesce ((Select top 1 num 
from MyNumbers 
group by num
having count(num)=1
order by num desc), null) as num
