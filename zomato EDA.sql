create database zomato;
use zomato;

-- PERFORMING EXPLORATORY DATA ANALYSIS
-- Q1  What are the top 10 highest-rated restaurants?
create view 10_highest_rated_resto as
select restaurant_name , Rating, Reviews_list, votes
from zomato_data
order by Rating desc  limit 10 ;

-- Q2 Which restaurant types are most common?
create view most_common_resto as
select restaurant_type , count(*) as count
from zomato_data
group by restaurant_type
order by count desc;

-- Q3 How does the average cost for two people vary by location?
create view avg_cost_for_two_people as 
select location, avg(cost_for_two_people) as avg_cost
from zomato_data
group by location
order by avg_cost desc;

-- Q4 Which locations have the highest number of restaurants?
create view num_of_resto as
select location, count(*) as num_resto
from zomato_data
group by location 
order by num_resto desc;

-- Q5 Do restaurants with online ordering have higher ratings?
create view online_ordering as
select  online_order, avg(Rating) as avg 
from zomato_data
group by online_order;

-- Q6 What is the average rating per restaurant type?
create view avg_rating as
select restaurant_type , avg(Rating) as avg_rate 
from zomato_data
group by restaurant_type;

-- Q7  What is the most common cuisine in top-rated restaurants?
 create view common_cuisine as
select cuisines, rating, count(*) as count
from zomato_data
where rating >= 4.5 
group by cuisines ,rating
order by count desc 
limit 10;

-- Q8 Which restaurants have the highest number of votes? 
create view max_votes as
select restaurant_name, votes
from zomato_data 
order by votes desc limit 5;

-- Q9  Which city has the most expensive restaurants on average?
create view expensive_resto as
select listed_in_city, avg(Cost_for_two_people) as avg
from zomato_data
group by listed_in_city 
order by avg desc limit 5;

-- Q10  Is there a correlation between cost and rating? 
create view correlation as
select case 
          when Cost_for_two_people < 500 then 'low'
          when Cost_for_two_people between 500 and 1000 then 'mediam'
          else 'high' 
          end as cost_category,
		  avg(Rating) as avg_rate
from zomato_data          
group by cost_category
order by avg_rate ; 
















