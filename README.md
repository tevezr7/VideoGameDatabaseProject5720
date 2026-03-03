Video Game Store Database
A normalized relational database modeling the backend of a retail video game store, built with PostgreSQL.
Schema Overview
9 tables modeling real-world retail relationships:

Fully normalized schema with primary keys, foreign keys, and referential integrity constraints
Composite primary keys on junction tables (inventory, order_item, game_availability)
unit_price_at_sale on order_item captures price at time of purchase, independent of current catalog price
Complex queries including:

Multi-table JOINs to surface customer order history
Aggregate functions (COUNT, SUM, AVG) for sales and review analysis
GROUP BY / HAVING for per-platform and per-store breakdowns
Subqueries for filtered lookups



Sample Queries
Top games by average review score:

sqlSELECT g.name, AVG(r.score) AS avg_score, COUNT(r.review_id) AS review_count
FROM game g
JOIN review r ON g.game_id = r.game_id
GROUP BY g.name
ORDER BY avg_score DESC;

Customer order history with itemized games:

sqlSELECT c.name AS customer, g.name AS game, p.name AS platform, oi.unit_price_at_sale
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_item oi ON o.order_id = oi.order_id
JOIN game g ON oi.game_id = g.game_id
JOIN platform p ON oi.platform_id = p.platform_id
ORDER BY c.name;

Inventory availability by store:

sqlSELECT s.name AS store, g.name AS game, p.name AS platform, i.quantity
FROM inventory i
JOIN store s ON i.store_id = s.store_id
JOIN game g ON i.game_id = g.game_id
JOIN platform p ON i.platform_id = p.platform_id
ORDER BY s.name, g.name;


Tech Stack

Database: PostgreSQL 18
Tool: pgAdmin
