SELECT player_id,min(event_date) As first_login
from Activity
Group by player_id
