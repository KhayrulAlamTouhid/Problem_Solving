--Answer: Find Customer Referee
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL
order by id asc;

--Answer 2: we can make it diffarent way.
SELECT c.name
FROM Customer c
LEFT JOIN Customer r ON c.referee_id = r.id AND r.id = 2
WHERE r.id IS NULL
order by id asc;
