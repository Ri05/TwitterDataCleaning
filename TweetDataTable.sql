CREATE TABLE tweets (
    id BIGINT PRIMARY KEY,
    event VARCHAR(50),
    ts1 TIMESTAMP,
    from_stream BOOLEAN,
    directly_from_stream BOOLEAN,
    from_search BOOLEAN,
    directly_from_search BOOLEAN,
    from_quote_search BOOLEAN,
    directly_from_quote_search BOOLEAN,
    from_convo_search BOOLEAN,
    directly_from_convo_search BOOLEAN,
    from_timeline_search BOOLEAN,
    directly_from_timeline_search BOOLEAN,
    text TEXT,
    author_id BIGINT,
    created_at TIMESTAMP,
    like_count INTEGER,
    place_id TEXT
);


COPY tweets (
    id,
    event,
    ts1,
    from_stream,
    directly_from_stream,
    from_search,
    directly_from_search,
    from_quote_search,
    directly_from_quote_search,
    from_convo_search,
    directly_from_convo_search,
    from_timeline_search,
    directly_from_timeline_search,
    text,
    author_id,
    created_at,
    like_count,
    place_id
)
FROM 'C:\Program Files\PostgreSQL\16\trimmed_twitter_201904.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');


--How many tweets were posted containing the term on each day?
select date(created_at) as date, count(*) as count
from tweets
where text ilike '%music%'
group by date(created_at);

-- How many unique users posted a tweet containing the term?
select count(distinct author_id) as unique_users
from tweets
where text ilike '%music%';

-- How many likes did tweets containing the term get, on average?
select avg(like_count) as average_likes
from tweets
where text ilike '%music%';

-- Where (in terms of place IDs) did the tweets come from?
select place_id, count(*) as count
from tweets
where text ilike '%music%'
group by place_id;

-- What times of day were the tweets posted at?
select extract(hour from created_at) as hour, count(*) as count
from tweets
where text ilike '%music%'
group by extract(hour from created_at);

-- Which user posted the most tweets containing the term?
select author_id, count(*) as count
from tweets
where text ilike '%music%'
group by author_id
order by count desc
limit 1;

