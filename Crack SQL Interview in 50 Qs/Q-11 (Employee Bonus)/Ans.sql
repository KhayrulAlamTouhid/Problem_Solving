Answer: Product Sales Analysis I

select e.name, b.bonus
from Employee e left join Bonus b
on e.empID = b.empID
where b.bonus < 1000 or bonus is null
order by bonus desc;
