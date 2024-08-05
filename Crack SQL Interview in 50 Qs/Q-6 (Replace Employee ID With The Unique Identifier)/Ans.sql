Answer: Replace Employee ID With The Unique Identifier

select u.unique_id, e.name
from 
Employees e left join EmployeeUNI u
on e.id = u.id
order by u.unique_id asc;