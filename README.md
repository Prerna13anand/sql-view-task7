# sql-view-task7
SQL Developer Internship - Task 7: Creating Views
This repository contains my submission for the seventh SQL task, which focuses on creating and using SQL Views to simplify complex queries and enhance data security.

Project Summary
The SQL script in this repository demonstrates the concept of views by performing three main actions:

Sets up the database: It first creates and populates a set of related tables for an online bookstore.

Creates Views: It then defines two distinct views:

CustomerOrderDetails: A complex view that joins four tables to provide a comprehensive report on customer orders. This demonstrates how views can simplify complex logic.

PublicBookList: A simple view that exposes only non-sensitive columns from the Books table (Title and Author). This demonstrates how views can be used for security.

Uses and Drops Views: The script queries these views just like regular tables to show how they work and includes an example of how to delete a view using DROP VIEW.

The script was tested using DB Fiddle with SQLite.

Interview Questions & Answers
1. What is a view?
A view is a virtual table based on the result-set of a stored SQL statement. It contains rows and columns, just like a real table, but it does not store the data itself. A view is essentially a saved query that can be used to simplify complex queries, provide a consistent presentation of data, and enhance security.

2. Can we update data through a view?
Yes, but with limitations. You can often perform UPDATE, INSERT, and DELETE operations on a simple view (one that is based on a single table and doesn't use aggregates, GROUP BY, DISTINCT, etc.). However, complex views involving multiple tables, aggregate functions, or other advanced features are generally not updatable.

3. What is a materialized view?
Unlike a standard view which is a virtual table, a materialized view is a physical copy of the data from the underlying query. It is stored on disk and must be refreshed periodically. The main advantage is performance, as querying a materialized view is much faster than running the complex query of a standard view every time.

4. Difference between view and table?
A table is a physical structure that stores data. A view is a virtual structure that does not store data itself; it is a saved query that retrieves data from one or more tables when it is accessed.

5. How to drop a view?
You can delete or remove a view using the DROP VIEW view_name; command.

6. Why use views?
Views are used for several reasons:

Simplicity: They hide the complexity of queries with multiple joins.

Security: They can restrict access to data by exposing only certain rows or columns to a user.

Consistency: They provide a consistent, pre-defined structure for data that multiple users or applications can rely on.

7. Can we create indexed views?
Yes, in some database systems like SQL Server, you can create a unique clustered index on a view, which physically stores the result set and improves performance for complex queries. This effectively turns it into a type of materialized view.

8. How to secure data using views?
You can create a view that selects only specific, non-sensitive columns from a table. You then grant users permission to access the view but not the underlying table. This prevents them from seeing the sensitive columns (e.g., salaries, personal information) that exist in the base table.

9. What are limitations of views?
The main limitations are:

They can have performance overhead since the underlying query runs every time the view is accessed (unless it's a materialized view).

They are often not updatable, especially if they are complex.

The data in a standard view is only as up-to-date as the data in the underlying tables.

10. How does WITH CHECK OPTION work?
The WITH CHECK OPTION is a constraint that can be added to an updatable view. It ensures that any INSERT or UPDATE operations performed through the view must conform to the conditions defined in the view's WHERE clause. This prevents a user from inserting or updating a row in a way that would make it invisible to the view afterward.
