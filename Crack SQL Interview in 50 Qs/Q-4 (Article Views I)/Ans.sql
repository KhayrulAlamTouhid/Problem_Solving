--Answer: Article Views I
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


--Answer 2: we can make it diffarent way.
SELECT author_id AS id
FROM Views
GROUP BY author_id
HAVING SUM(CASE WHEN author_id = viewer_id THEN 1 ELSE 0 END) > 0
ORDER BY id;
