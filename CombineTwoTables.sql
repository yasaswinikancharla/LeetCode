/* Write your T-SQL query statement below */
SELECT P.firstName, P.lastName, a.city, a.state
from Person as P 
  Left Join Address as a on P.personId= a.personId
