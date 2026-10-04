USE NovaDB;  
GO


INSERT INTO Customers (username, email, phone, adress, join_date) VALUES
('Ahmed Hassan',    'ahmed.hassan@mail.com',    '01011111111', 'Cairo',      '20241105'),
('Mona Ali',        'mona.ali@mail.com',        '01022222222', 'Giza',       '20241210'),
('Omar Khaled',     'omar.khaled@mail.com',     '01033333333', 'Alexandria', '20241220'),
('Sara Mahmoud',    'sara.mahmoud@mail.com',    '01044444444', 'Sohag',      '20250105'),
('Youssef Ibrahim', 'youssef.ibrahim@mail.com', '01055555555', 'Assiut',     '20250112'),
('Nour Adel',       'nour.adel@mail.com',       '01066666666', 'Luxor',      '20250120'),
('Hana Samir',      'hana.samir@mail.com',      '01077777777', 'Cairo',      '20250201'),
('Karim Fathy',     'karim.fathy@mail.com',     '01088888888', 'Mansoura',   '20250215'),
('Laila Mostafa',   'laila.mostafa@mail.com',   '01099999999', 'Tanta',      '20250301'),
('Mahmoud Tarek',   'mahmoud.tarek@mail.com',   '01012121212', 'Aswan',      '20250320'),
('Dina Salah',      'dina.salah@mail.com',      '01023232323', 'Minya',      '20250410'),
('Ali Hossam',      'ali.hossam@mail.com',      '01034343434', 'Fayoum',     '20250425'),
('Mariam Nabil',    'mariam.nabil@mail.com',    '01045454545', 'Port Said',  '20250505'),
('Tamer Wael',      'tamer.wael@mail.com',      '01056565656', 'Suez',       '20250520'),
('Rana Ehab',       'rana.ehab@mail.com',       '01067676767', 'Ismailia',   '20250601'),
('Hossam Adel',     'hossam.adel@mail.com',     '01078787878', 'Beni Suef',  '20250615'),
('Salma Yasser',    'salma.yasser@mail.com',    '01089898989', 'Damietta',   '20250701'),
('Khaled Magdy',    'khaled.magdy@mail.com',    '01090909090', 'Zagazig',    '20250715'),
('Nada Reda',       'nada.reda@mail.com',       '01013131313', 'Qena',       '20250801'),
('Amr Sherif',      'amr.sherif@mail.com',      '01024242424', 'Hurghada',   '20250815');

INSERT INTO Products (product_name, product_category, selling_price, product_quantity) VALUES
('Laptop Dell Inspiron',    'Electronics',      18000,  15),
('Smartphone Samsung A54',  'Electronics',      12000,  30),
('Wireless Headphones',     'Electronics',       1500,  50),
('Bluetooth Speaker',       'Electronics',       2200,  40),
('Men Jacket',              'Fashion',           1200,  40),
('Women Dress',             'Fashion',            900,  35),
('Running Shoes',           'Fashion',           1800,  45),
('Cotton T-Shirt',          'Fashion',            250, 120),
('Microwave Oven',          'Home Appliances',   4500,  20),
('Electric Kettle',         'Home Appliances',    650,  60),
('Air Fryer',               'Home Appliances',   3800,  25),
('Vacuum Cleaner',          'Home Appliances',   6500,  12),
('SQL Server Book',         'Books',              450,  25),
('Python Programming Book', 'Books',              380,  45),
('Data Science Handbook',   'Books',              520,  30),
('Leather Wallet',          'Accessories',        500,  70),
('Smart Watch',             'Accessories',       3200,  18),
('Backpack',                'Accessories',        800,  55),
('Sunglasses',              'Accessories',        700,  40),
('Phone Case',              'Accessories',        150, 200);

INSERT INTO Orders (customer_id, order_date, status) VALUES
(1,  '20250110', 'Delivered'),   -- order 1
(2,  '20250118', 'Delivered'),   -- order 2
(3,  '20250125', 'Delivered'),   -- order 3
(1,  '20250203', 'Delivered'),   -- order 4
(4,  '20250212', 'Delivered'),   -- order 5
(5,  '20250220', 'Cancelled'),   -- order 6
(6,  '20250228', 'Delivered'),   -- order 7
(2,  '20250306', 'Delivered'),   -- order 8
(7,  '20250315', 'Shipped'),     -- order 9
(3,  '20250322', 'Delivered'),   -- order 10
(8,  '20250404', 'Delivered'),   -- order 11
(4,  '20250410', 'Pending'),     -- order 12
(9,  '20250418', 'Delivered'),   -- order 13
(10, '20250502', 'Delivered'),   -- order 14
(1,  '20250510', 'Shipped'),     -- order 15
(11, '20250521', 'Delivered'),   -- order 16
(12, '20250603', 'Pending'),     -- order 17
(13, '20250612', 'Delivered'),   -- order 18
(14, '20250620', 'Delivered'),   -- order 19
(15, '20250702', 'Delivered');   -- order 20

INSERT INTO Order_Details (order_id, poduct_id, required_quantity, selling_price) VALUES
(1,  1,  1, 17500),
(1,  3,  1, 1500),
(2,  2,  1, 12000),
(2,  16, 1, 500),
(3,  9,  1, 4500),
(3,  10, 2, 650),
(4,  13, 1, 450),
(5,  5,  1, 1200),
(5,  6,  2, 900),
(6,  14, 3, 380),
(7,  7,  1, 1800),
(8,  3,  1, 1400),
(8,  4,  1, 2200),
(9,  11, 1, 3800),
(10, 12, 1, 6500),
(10, 15, 1, 520),
(11, 2,  1, 11500),
(12, 13, 1, 450),
(12, 14, 2, 380),
(13, 17, 1, 3000),
(14, 8,  4, 250),
(15, 1,  1, 18000),
(15, 4,  1, 2200),
(16, 9,  1, 4500),
(16, 17, 1, 3200),
(17, 10, 2, 650),
(18, 15, 2, 520),
(19, 7,  1, 1700),
(19, 8,  2, 250),
(20, 5,  1, 1100);

INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES
(1,  '20250110', 19000, 'Credit Card'),
(2,  '20250118', 12500, 'PayPal'),
(3,  '20250125',  5800, 'COD'),
(4,  '20250203',   450, 'Credit Card'),
(5,  '20250212',  3000, 'PayPal'),
(6,  '20250220',  1140, 'Credit Card'),
(7,  '20250228',  1800, 'COD'),
(8,  '20250306',  3600, 'PayPal'),
(9,  '20250315',  3800, 'COD'),
(10, '20250322',  7020, 'Credit Card'),
(11, '20250404', 11500, 'PayPal'),
(12, '20250410',  1210, 'COD'),
(13, '20250418',  3000, 'Credit Card'),
(14, '20250502',  1000, 'COD'),
(15, '20250510', 20200, 'Credit Card'),
(16, '20250521',  7700, 'PayPal'),
(17, '20250603',  1300, 'COD'),
(18, '20250612',  1040, 'PayPal'),
(19, '20250620',  2200, 'Credit Card'),
(20, '20250702',  1100, 'PayPal');

INSERT INTO Reviews (customer_id, poduct_id, rating, comment, review_date) VALUES
(1,  1,  5, 'Great laptop',            '20250120'),
(1,  3,  4, 'Good sound',              '20250121'),
(1,  13, 5, 'Very useful book',        '20250215'),
(2,  2,  5, 'Excellent phone',         '20250128'),
(2,  16, 2, 'Stitching came loose',    '20250129'),
(2,  3,  5, 'Worth the price',         '20250320'),
(3,  9,  4, 'Heats evenly',            '20250210'),
(3,  12, 3, 'Strong but noisy',        '20250405'),
(4,  5,  3, NULL,                      '20250225'),
(4,  6,  4, 'Nice fabric',             '20250226'),
(6,  7,  2, 'Sole wore out fast',      '20250315'),
(8,  2,  1, 'Battery drains quickly',  '20250420'),
(9,  17, 5, 'Love this watch',         '20250505'),
(10, 8,  4, NULL,                      '20250515'),
(11, 9,  5, 'Great oven',              '20250605'),
(11, 17, 4, 'Good battery life',       '20250606'),
(13, 15, 5, 'Clear explanations',      '20250620'),
(14, 7,  4, 'Comfortable',             '20250628'),
(14, 8,  3, NULL,                      '20250629'),
(15, 5,  2, 'Size runs small',         '20250710');
GO