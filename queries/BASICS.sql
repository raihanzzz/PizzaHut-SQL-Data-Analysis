-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from pizza sales.
SELECT round( SUM(orders_details.quantity * pizzas.price) ,2) as total_revenue
from orders_details join pizzas
on pizzas.pizza_id = orders_details.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;


-- Identify the most common pizza size ordered.
select pizzas.size, count(orders_details.order_details_id) as order_count
from pizzas join orders_details
on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size
order by order_count desc;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name, SUM(orders_details.quantity) as quantity
from pizza_types join pizzas                         -- 1ST JOIN
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details                                  -- 2ND JOIN
on orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
order by quantity DESC LIMIT 5;