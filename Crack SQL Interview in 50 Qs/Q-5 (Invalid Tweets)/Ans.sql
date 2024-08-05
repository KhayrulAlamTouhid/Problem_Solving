Answer: Invalid Tweets

select tweet_id
from Tweets
where length(content) > 15
order by tweet_id asc;