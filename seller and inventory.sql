use ProductCategoryDB;

SELECT * FROM Category;
SELECT * FROM Product;

create table Seller(Seller_id int primary key,
Seller_name varchar(50) not null,
Email varchar(100) not null unique,
Phone varchar(15) not null unique,
Address varchar(300) not null);

insert into Seller
(Seller_ID, Seller_Name, Email, Phone, Address)
values
(1, 'Tech World', 'techworld@gmail.com', '9876543210', 'Chennai'),
(2, 'Smart Mart', 'smartmart@gmail.com', '9876543211', 'Coimbatore'),
(3, 'Digital Hub', 'digitalhub@gmail.com', '9876543212', 'Madurai'),
(4, 'Gadget Store', 'gadgetstore@gmail.com', '9876543213', 'Thoothukudi'),
(5, 'Online Bazaar', 'onlinebazaar@gmail.com', '9876543214', 'Tirunelveli');

desc Seller;

create table Inventory(Inventory_id int primary key,
Product_id int not null,
Seller_id int not null,
Stock_Quantity int not null,
Stock_Status varchar(20) not null,
Last_Updated date not null,

constraint fk_inventory_product foreign key(Product_id)
references Product(Product_id),

constraint fk_inventory_seller foreign key(Seller_id)
references Seller(Seller_id),

constraint chk_stock_quantity
check (Stock_Quantity >= 0),

constraint chk_stock_status
check (Stock_Status in ('Available','Out of Stock'))
);


desc Inventory;

select*from Seller;

select Product_ID, Product_Name from Product;

insert into Inventory
(Inventory_ID,Product_ID,Seller_ID,Stock_Quantity,Stock_Status,Last_Updated)
values
(1, 101, 1, 25, 'Available', '2026-09-20'),
(2, 102, 1, 8, 'Available', '2026-09-20'),
(3, 103, 2, 0, 'Out of Stock', '2026-09-21'),
(4, 104, 2, 15, 'Available', '2026-09-21'),
(5, 105, 3, 5, 'Available', '2026-09-22'),
(6, 106, 3, 30, 'Available', '2026-09-22'),
(7, 107, 4, 0, 'Out of Stock', '2026-09-23'),
(8, 108, 4, 12, 'Available', '2026-09-23'),
(9, 109, 5, 50, 'Available', '2026-09-24'),
(10, 110, 5, 3, 'Available', '2026-09-24'),
(11, 111, 1, 18, 'Available', '2026-09-25'),
(12, 112, 2, 22, 'Available', '2026-09-25');

INSERT INTO Seller
(
    Seller_ID,
    Seller_Name,
    Email,
    Phone,
    Address
)
VALUES
(
    6,
    'ABC Electronics',
    'abc@gmail.com',
    '9876543215',
    'Bangalore'
);

SELECT * FROM Seller;

INSERT INTO Inventory
(
    Inventory_ID,
    Product_ID,
    Seller_ID,
    Stock_Quantity,
    Stock_Status,
    Last_Updated
)
VALUES
(
    13,
    101,
    6,
    20,
    'Available',
    '2026-09-25'
);

SELECT * FROM Inventory
WHERE Seller_ID = 6;

SELECT
    s.Seller_ID,
    s.Seller_Name,
    p.Product_ID,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Seller s
JOIN Inventory i
    ON s.Seller_ID = i.Seller_ID
JOIN Product p
    ON i.Product_ID = p.Product_ID
ORDER BY s.Seller_Name;

SELECT
    s.Seller_ID,
    s.Seller_Name,
    COUNT(i.Product_ID) AS Product_Count
FROM Seller s
LEFT JOIN Inventory i
    ON s.Seller_ID = i.Seller_ID
GROUP BY
    s.Seller_ID,
    s.Seller_Name
ORDER BY s.Seller_ID;

UPDATE Seller
SET
    Seller_Name = 'Tech World Updated',
    Email = 'updatedtech@gmail.com',
    Phone = '9999999999',
    Address = 'Chennai'
WHERE Seller_ID = 1;

SELECT *
FROM Seller
WHERE Seller_ID = 1;

SELECT
    p.Product_ID,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Product p
JOIN Inventory i
    ON p.Product_ID = i.Product_ID
WHERE i.Stock_Quantity > 0;

SELECT
    p.Product_ID,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Product p
JOIN Inventory i
    ON p.Product_ID = i.Product_ID
WHERE i.Stock_Quantity = 0;

SELECT
    p.Product_ID,
    p.Product_Name,
    i.Stock_Quantity
FROM Product p
JOIN Inventory i
    ON p.Product_ID = i.Product_ID
WHERE i.Stock_Quantity < 10;

UPDATE Inventory
SET
    Stock_Quantity = 20,
    Stock_Status = 'Available',
    Last_Updated = '2026-09-25'
WHERE Inventory_ID = 2;

SELECT *
FROM Inventory
WHERE Inventory_ID = 2;

DELETE FROM Inventory
WHERE Inventory_ID = 13;

SELECT * FROM Inventory;







