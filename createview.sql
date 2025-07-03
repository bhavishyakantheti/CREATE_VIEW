 SQL> CREATE VIEW Order_Details AS
  2  SELECT
  3      (SELECT customername
  4       FROM customer
  5       WHERE customerid = (
  6           SELECT customerid
  7           FROM orders
  8           WHERE order_id = (
  9               SELECT MIN(order_id) FROM orders
 10           )
 11       )
 12      ) AS customername,
 13      (SELECT pname
 14       FROM product
 15       WHERE productid = (
 16           SELECT productid
 17           FROM orders
 18           WHERE order_id = (
 19               SELECT MIN(order_id) FROM orders
 20           )
 21       )
 22      ) AS product_name,
 23      (SELECT order_date
 24       FROM orders
 25       WHERE order_id = (
 26           SELECT MIN(order_id) FROM orders
 27       )
 28      ) AS order_date
 29  FROM dual;

View created.

SQL> select * from Order_Details;

CUSTOMERNAME                   PRODUCT_NAME         ORDER_DAT                   
------------------------------ -------------------- ---------                   
SMITH                          EARBUDS-NOIDA-109.A  24-SEP-24                   

SQL> spool off
