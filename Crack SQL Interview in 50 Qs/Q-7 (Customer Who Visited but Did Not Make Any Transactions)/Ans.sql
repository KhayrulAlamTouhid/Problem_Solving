Answer: Customer Who Visited but Did Not Make Any Transactions

Select V.customer_id, count(V.visit_id) as count_no_trans 
from Visits V left join Transactions T 
On V.visit_id = T.visit_id 
where T.visit_id is null 
group by V.customer_id
order by count_no_trans asc;