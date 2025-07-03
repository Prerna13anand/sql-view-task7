-- PART 1: SETUP - CREATE TABLES AND INSERT DATA
-- We need a populated database to create our views from.

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE
);

CREATE TABLE Order_Items (
    OrderItemID INTEGER PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT NOT NULL
);

-- Insert sample data
INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'Arav', 'Mehta'), (2, 'Vishu', 'Joshi'), (3, 'Arav', 'Gupta');

INSERT INTO Books (BookID, Title, Author, Price, StockQuantity) VALUES
(101, 'The Alchemist', 'Paulo Coelho', 12.99, 50),
(102, '1984', 'George Orwell', 9.50, 80),
(103, 'Malgudi Days', 'R. K. Narayan', 11.00, 45);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2024-07-01'), (1002, 2, '2024-07-02'), (1003, 1, '2024-07-03');

INSERT INTO Order_Items (OrderItemID, OrderID, BookID, Quantity) VALUES
(201, 1001, 102, 1), (202, 1002, 101, 2), (203, 1003, 103, 1);



-- PART 2: CREATING AND USING VIEWS 

-- Example 1: Creating a Complex View to Simplify Queries
-- This view joins four tables to create a detailed order report.
CREATE VIEW CustomerOrderDetails AS
SELECT
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate,
    B.Title AS BookTitle,
    OI.Quantity,
    B.Price AS PricePerItem
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN Order_Items AS OI ON O.OrderID = OI.OrderID
JOIN Books AS B ON OI.BookID = B.BookID;


-- Instead of writing the long join query:
SELECT * FROM CustomerOrderDetails;


-- Example 2: Creating a Simple View for Security
-- This view only shows non-sensitive book information.
-- We can give users access to this view instead of the full Books table.
CREATE VIEW PublicBookList AS
SELECT
    Title,
    Author
FROM Books;

-- Using the view to see the public list of books.
SELECT * FROM PublicBookList;


-- Example 3: Dropping a View
DROP VIEW PublicBookList;