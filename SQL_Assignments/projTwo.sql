/*You will need to write SELECT commands to answer the following questions.  Print the question, the SELECT command and your results.  
Use the Alpine Adventures database to write your queries.  The italicized value in the question should be the actual column name in the 
result.  In some cases, you may need to use column aliases.*/

 

#-Select all the rows from the Item table. Display Description and Category
SELECT description,category FROM alp_item;
#-Select inventory items that have a price of less than 100 dollars. Display Inventory id, Size, Price and QOH
SELECT inv_id,item_size,price,quantity_on_hand FROM alp_inventory WHERE price<100.00;
#-List the inventory items that have a QOH of more than 30. Display Inventory id, QOH and Price
SELECT inv_id,quantity_on_hand,price FROM alp_inventory WHERE quantity_on_hand>30;
#-List the customers in ‘Washburn ’ and ‘Silver Lake’. Display first name, last name, mi and city
SELECT first,last,mi,city FROM alp_customer WHERE city="Washburn" OR city="Silver Lake";
#-Select the prices that occur in the Inventory table. A specific price should only appear once. Display the Price
SELECT DISTINCT price FROM alp_inventory;
#-Select the inventory items that are in stock. Display Inventory id, Price and QOH
SELECT inv_id,price,quantity_on_hand FROM alp_inventory WHERE quantity_on_hand>0;
#-Select the customer orders placed before November 1, 2007. Display the Order_id, cust_id, and Order_date
SELECT order_id,cust_id,order_date FROM alp_orders WHERE order_date < '2007-11-01';
#-List the inventory items that are ‘Coral’ or ‘Olive’ and have a QOH of less than 105. Display Inventory id and QOH, and color
SELECT inv_id,quantity_on_hand,alp_color FROM alp_inventory WHERE quantity_on_hand<105 AND alp_color='Coral' OR quantity_on_hand<105 AND alp_color='Olive'; 
#-List the items that contain the word ‘Fleece’ in the item description. Display Item_id, description, and Category
SELECT item_id,description,category FROM alp_item WHERE description LIKE '%Fleece%';
#-List all the inventory items that do not have a size or color assigned. Display the Inventory id and Price
SELECT inv_id,price FROM alp_inventory WHERE alp_color OR item_size IS NULL;
#-Determine the number of orders placed on 10 October 2007. Display Number of Orders 
#Hint: Use the COUNT function
SELECT Sum(CASE WHEN order_date = '2007-10-10' THEN 1 ELSE 0 END) AS num_of_orders FROM alp_orders;
#-Determine the extended price for each row in the Orderline table. Display Order_id, Inventory_id, and Extended Price
SELECT order_id,inv_id,(order_price * qty) extended_price FROM alp_orderline;
#-Determine the number of different items on each order. Display Order_ID and Number of Items  Hint: Determine the number
#	of different products ordered, not the total quantity ordered. This query requires a GROUP BY clause.
SELECT order_id,count(*) num_of_items FROM alp_orderline GROUP BY order_id;
#-Determine the number of orders placed by each customer. Only display the data for customers who have placed more than 
#	one order. Display Cust_id and Number of Orders  Hint: This query requires a GROUP BY clause and a HAVING clause.
SELECT cust_id,count(*) num_of_orders FROM alp_orders GROUP BY cust_id HAVING num_of_orders > 1;
#-Determine the order total for each order that has an order total greater than 100.  Display ‘Order Id’ and ‘Order Total’.  Make 
#	sure the results are in ascending order total sequence.
SELECT order_id,(order_price * qty) order_total FROM alp_orderline HAVING order_total > 100 ORDER BY order_total ASC;
#-Determine what is the most expensive price, the least expensive price, and the average price in the inventory table.
SELECT MAX(price) AS most_expensive,MIN(price) AS least_expensive, AVG(price) AS average FROM alp_inventory;
#-Now that you know the average price in the inventory table, display all of the information for inventory items whose price is 
#	greater than the average price.
SELECT inv_id,item_id,item_size,alp_color,price,quantity_on_hand FROM alp_inventory WHERE price > (SELECT AVG(price) FROM alp_inventory);
