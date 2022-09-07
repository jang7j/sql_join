/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as 'Product name', c.name as Category
from products as p
inner join categories as c
on p.categoryID = c.CategoryID
where c.name = 'Computers';
-- or where c.categoryID = 1;

-- or -- 
select products.Name as "Product Name", categories.Name as "Category Name"
from products
left join categories
on products.CategoryID = categories.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.name, products.price, reviews.Rating
from products
inner join reviews
on reviews.ProductID = products.productID
where reviews.rating = 5;

select products.name, products.price, reviews.rating
from products
inner join reviews
on products.ProductID = reviews.ProductID
where reviews.rating = 5;
-- or where reviews.rating like "%5%";
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- not sum of everything but for one specific employee

select employees.FirstName, employees.lastname, employees.sum(sales.quantity) as total
-- select employees.Employee, employees.sum(sales.quantity) as total
inner join employees
on sales.employeeID = employees.EmployeeID
group by employees.employeeID
order by total desc;
-- limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.name as 'Department name', categories.name as 'category name'
from departments
inner join categories
on departments.departmentID = categories.CategoryID
where categories.name = 'applicances' or categories.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, Sum(s.quantity) as 'total units sold',
Sum(s.quantity * s.priceperunit) as 'total price sold'
from products as p
inner join sales as s
on s.productID = p.productID
where name like '%Eagles: Hotel California%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.rating, reviews.comment
from products
inner join reviews
on products.productID = reviews.productID
where products.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID 
-  the employee's first and last name 
-  the name of each product
-  and how many of that product they sold */

select employees.EmployeeID, employees.firstname, employees.LastName, products.name, sum(sales.quantity) as 'total units sold'
from employees
inner join sales on employees.EmployeeID = sales.EmployeeID
inner join products on sales.ProductID = products.productID
group by employees.EmployeeID, products.ProductID 
order by employees.firstname;
-- group by is normally used with aggregate functions. because sum(sales.quantity) gives one result
-- products.productID provides another layer to show what products that A.Leonetti sold