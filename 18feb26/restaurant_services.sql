----Table for owners
CREATE TABLE owners (
    owner_id BIGINT PRIMARY KEY IDENTITY(10023770,1),
    owner_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at DATETIME2 DEFAULT SYSDATETIME()
);

---Table for restaurants with ownersId
CREATE TABLE restaurants (
    restaurant_id BIGINT IDENTITY(20023670,1) PRIMARY KEY,
    owner_id BIGINT NOT NULL,
    restaurant_name VARCHAR(150) NOT NULL,
    description VARCHAR(MAX),
    approval_status VARCHAR(20) 
        CHECK (approval_status IN ('pending','approved','rejected')) 
        DEFAULT 'pending',
    is_active BIT DEFAULT 1,
    is_deleted BIT DEFAULT 0,
    rating DECIMAL(3,2) DEFAULT 0,
    total_reviews INT DEFAULT 0,
    total_orders INT DEFAULT 0,
    is_accepting_orders BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT SYSDATETIME(),
    updated_at DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_restaurants_owner
        FOREIGN KEY (owner_id) 
        REFERENCES owners(owner_id)
        ON DELETE NO ACTION
);

---restaurant branches of the specific restaurant
CREATE TABLE restaurant_branches (
    branch_id BIGINT IDENTITY(30023570,1) PRIMARY KEY,
    restaurant_id BIGINT NOT NULL,
    address VARCHAR(MAX) NOT NULL,
    city VARCHAR(100),
    area VARCHAR(100),
    pincode VARCHAR(10),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    opening_time TIME,
    closing_time TIME,
    prep_time_minutes INT DEFAULT 30,
    is_temporarily_closed BIT DEFAULT 0,
    is_active BIT DEFAULT 1,

    CONSTRAINT FK_branches_restaurant
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
        ON DELETE CASCADE
);

--which area that specific restaurant will be able to deliver
CREATE TABLE service_areas (
    service_area_id BIGINT IDENTITY(40023470,1) PRIMARY KEY,
    branch_id BIGINT NOT NULL,
    pincode VARCHAR(10) NOT NULL,

    CONSTRAINT FK_service_area_branch
        FOREIGN KEY (branch_id)
        REFERENCES restaurant_branches(branch_id)
        ON DELETE CASCADE
);

----Timings of specific restaurant
CREATE TABLE timings (
    timing_id BIGINT IDENTITY(50023370,1) PRIMARY KEY,
    branch_id BIGINT NOT NULL,
    [date] DATE NOT NULL,
    opening_time TIME,
    closing_time TIME,
    is_closed BIT DEFAULT 0,

    CONSTRAINT FK_special_timing_branch
        FOREIGN KEY (branch_id)
        REFERENCES restaurant_branches(branch_id)
        ON DELETE CASCADE
);

----users 
CREATE TABLE users (
    user_id BIGINT IDENTITY(60023270,1) PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    created_at DATETIME2 DEFAULT SYSDATETIME()
);
---users address to deliver the order
CREATE TABLE user_addresses (
    address_id BIGINT IDENTITY(70023170,1) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    address_line VARCHAR(MAX) NOT NULL,
    city VARCHAR(100),
    area VARCHAR(100),
    pincode VARCHAR(10),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    is_default BIT DEFAULT 0,
    created_at DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_user_addresses_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

----specific restaurant menu items
CREATE TABLE menu_items (
    item_id BIGINT IDENTITY(80023070,1) PRIMARY KEY,
    branch_id BIGINT NOT NULL,
    item_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(100),

    type VARCHAR(20)
        CHECK (type IN ('veg','non-veg','dessert','drinks')),

    description VARCHAR(MAX),

    is_available BIT DEFAULT 1,

    CONSTRAINT FK_menu_items_branch
        FOREIGN KEY (branch_id)
        REFERENCES restaurant_branches(branch_id)
        ON DELETE CASCADE
);

-----user ordered details according to delivery address
CREATE TABLE orders (
    order_id BIGINT IDENTITY(80023170,1) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    branch_id BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    order_status VARCHAR(20)
        CHECK (order_status IN ('placed','confirmed','preparing','delivered','cancelled')),

    payment_status VARCHAR(20)
        CHECK (payment_status IN ('pending','paid','failed')),

    created_at DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE NO ACTION,

    CONSTRAINT FK_orders_branch
        FOREIGN KEY (branch_id)
        REFERENCES restaurant_branches(branch_id)
        ON DELETE NO ACTION,

    CONSTRAINT FK_orders_address
        FOREIGN KEY (address_id)
        REFERENCES user_addresses(address_id)
        ON DELETE NO ACTION
);

---items that the user ordered
CREATE TABLE order_items (
    order_item_id BIGINT IDENTITY(80023270,1) PRIMARY KEY,
    order_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT FK_order_items_item
        FOREIGN KEY (item_id)
        REFERENCES menu_items(item_id)
        ON DELETE NO ACTION
);

----reviews according to the user of specific restaurant
CREATE TABLE reviews (
    review_id BIGINT IDENTITY(80023370,1) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(MAX),
    created_at DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_reviews_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT FK_reviews_restaurant
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
        ON DELETE CASCADE
);
select * from owners;
select * from restaurants;
select * from restaurant_branches;
select * from service_areas;
select * from timings;
select * from menu_items;
select * from orders;
select * from order_items;
select * from reviews;
select * from users;
select * from user_addresses;



-------------
select * from owners;

INSERT INTO owners (owner_name, phone_number, email)
VALUES
(100023781,'Paradise Foods Pvt Ltd', '040-12345678', 'contact@paradisebiriyani.com'),
(100023782,'Barbeque Nation Hospitality Ltd', '080-45678901', 'support@barbequenation.com'),
(100023783,'Saravana Bhavan Global', '044-99887766', 'info@saravanabhavan.com'),
(100023784,'Karim''s Group Delhi', '011-88776655', 'hello@karimsdelhi.com'),
(100023785,'Bikanervala Foods Pvt Ltd', '011-77665544', 'contact@bikanervala.com'),
(100023796,'KFC India Pvt Ltd', '022-88776644', 'support@kfcindia.com'),
(100023797,'Dominos Pizza India', '080-77665544', 'hello@dominos.co.in'),
(100023798,'Meghana Foods Pvt Ltd', '080-44556677', 'info@meghanafoods.in'),
(100023799,'Tunday Kababi Lucknow', '0522-99887766', 'contact@tundaykababi.com');
------------------
select * from restaurants;

INSERT INTO restaurants
(restaurant_id, owner_id, restaurant_name, description, approval_status, rating, total_reviews, total_orders)
VALUES
(20023682,10023781,'Paradise Biryani','Famous Hyderabadi Dum Biryani','approved',4.6,12500,240000),
(20023683,10023782,'Barbeque Nation','Live Grill & Buffet Dining Experience','approved',4.4,9800,180000),
(20023684,10023783,'Saravana Bhavan','Authentic South Indian Vegetarian Cuisine','approved',4.5,8600,150000),
(20023685,10023784,'Karim''s','Legendary Mughlai Restaurant in Old Delhi','approved',4.3,7200,110000),
(20023686,10023785,'Bikanervala','Popular North Indian Sweets & Snacks Chain','approved',4.2,6500,90000),
(20023687,10023796,'KFC Hyderabad','World famous fried chicken chain','approved',4.1,20000,350000),
(20023688,10023797,'Dominos HSR Layout','Pizza delivery chain open late','approved',4.3,30000,500000),
(20023689,10023798,'Meghana Foods Koramangala','Famous Bangalore biryani','approved',4.6,18000,280000),
(20023690,10023799,'Tunday Kababi Aminabad','Legendary kebabs in Lucknow','approved',4.4,12000,150000);
---------

select * from restaurant_branches;

INSERT INTO restaurant_branches
(branch_id, restaurant_id, address, city, area, pincode, opening_time, closing_time)
VALUES
(3023576,20023682,'Necklace Road','Hyderabad','Necklace Road','500082','10:00','23:00'),
(3023577,20023683,'Indiranagar 100 Feet Rd','Bengaluru','Indiranagar','560038','11:00','23:30'),
(3023578,20023684,'T Nagar Main Road','Chennai','T Nagar','600017','07:00','22:00'),
(3023579,20023685,'Jama Masjid Road','Delhi','Old Delhi','110006','11:00','22:00'),
(3023580,20023686,'Sector 18 Market','Noida','Sector 18','201301','09:00','22:00'),
(3023581,20023687,'Banjara Hills Road 1','Hyderabad','Banjara Hills','500034','10:00','23:00'),
(3023582,20023688,'HSR Layout Sector 2','Bengaluru','HSR Layout','560102','11:00','01:00'),
(3023583,20023689,'Koramangala 5th Block','Bengaluru','Koramangala','560095','11:00','23:30'),
(3023584,20023690,'Aminabad Market','Lucknow','Aminabad','226018','12:00','22:30');

 ------------------
 select * from users;


 INSERT INTO users (user_name, mobile_number, email)
VALUES
(70023179,'Sushanth Reddy', '9876543210', 'sushanth@example.com'),
(70023180,'Rishanth Reddy', '9123456780', 'rishanth@example.com'),
(70023181,'Uma', '9988776655', 'uma@example.com'),
(70023182,'Sai Thirupathi Reddy', '9001111111', 'sai@example.com'),
(70023183,'Nanda Kumar', '9002222222', 'nanda@example.com'),
(70023184,'Navaneeth', '9003333333', 'navaneeth@example.com');

----------------------
select * from user_addresses;

INSERT INTO user_addresses
(user_id, address_line, city, area, pincode, latitude, longitude, is_default)
VALUES
(70023179,'Flat 101 Jubilee Hills', 'Hyderabad', 'Jubilee Hills', '500033', 17.4325, 78.4121, 1),
(70023180,'T Nagar Apartment', 'Chennai', 'T Nagar', '600017', 13.0415, 80.2382, 1),
(70023181,'Sector 18 Residence', 'Noida', 'Sector 18', '201301', 28.5745, 77.3235, 1),
(70023182,'Flat 101 Jubilee Hills', 'Hyderabad', 'Jubilee Hills', '500033', NULL, NULL, 1),
(70023183,'HSR Layout Apartment', 'Bengaluru', 'HSR Layout', '560102', NULL, NULL, 1),
(70023184,'Aminabad Street House', 'Lucknow', 'Aminabad', '226018', NULL, NULL, 1);
 ----------------------
 select * from service_areas;
 INSERT INTO service_areas (branch_id, pincode)
VALUES
(40023477,30023576, '500082'),
(40023478,30023577, '560038'),
(40023479,30023578, '600017'),
(40023480,30023579, '110006'),
(40023481,30023580, '201301'),
(40023482,30023581, '500034'),
(40023483,30023582, '560102'),
(40023484,30023583, '560095'),
(40023485,30023584, '226018');

------------------

select * from menu_items;
INSERT INTO menu_items
(branch_id, item_name, price, category, type, description)
VALUES
(80023077,30023576,'Hyderabadi Chicken Biryani', 420.00, 'Biryani', 'non-veg', 'Authentic dum cooked chicken biryani'),
(80023078,30023576,'Veg Biryani', 320.00, 'Biryani', 'veg', 'Spicy vegetable biryani'),
(80023079,30023578,'Masala Dosa', 140.00, 'South Indian', 'veg', 'Crispy dosa with potato filling'),
(80023080,30023579,'Mutton Korma', 650.00, 'Mughlai', 'non-veg', 'Slow cooked Mughlai curry'),
(80023081,30023580,'Chole Bhature', 150.00, 'North Indian', 'veg', 'Classic Punjabi dish'),
(80023082,30023581,'Chicken Bucket 8 pcs', 599.00, 'Chicken', 'non-veg', 'Crispy fried chicken'),
(80023083,30023582,'Farmhouse Pizza Medium', 449.00, 'Pizza', 'veg', 'Loaded veg pizza'),
(80023084,30023583,'Boneless Chicken Biryani', 420.00, 'Biryani', 'non-veg', 'Signature Meghana biryani'),
(80023085,30023584,'Galouti Kebab', 320.00, 'Kebab', 'non-veg', 'Famous Lucknow kebab');

 ---------
 select * from orders;
select * from order_items;
 INSERT INTO orders
(user_id, branch_id, address_id, total_amount, order_status, payment_status)
VALUES
(80023175,60023274,30023576,70023179,420.00, 'placed', 'paid'),
(80023176,60023277,30023581,70023182,599.00, 'delivered', 'paid'),
(80023177,60023278,30023582,70023183,449.00, 'confirmed', 'paid'),
(80023178,60023279,30023583,70023184,420.00, 'preparing', 'paid'),
(80023179,60023277,30023584,70023182,320.00, 'placed', 'pending');
-----------
INSERT INTO order_items
(order_id, item_id, quantity, price)
VALUES
(80023272,80023175,80023077,1, 420.00),
(80023273,80023175,80023078,1, 320.00),
(80023274,80023179,80023082,1, 599.00),
(80023275,80023177,80023083,1, 449.00),
(80023276,80023178,80023084,1, 420.00),
(80023277,80023179,80023085,1, 320.00);
----------------
INSERT INTO timings (branch_id, [date], opening_time, closing_time, is_closed)
VALUES
(50023370,30023578,'2026-08-15', NULL, NULL, 1),
(50023371,30023576,'2026-12-31', '14:00', '02:00', 0),
(50023372,30023581,'2026-01-26', NULL, NULL, 1),
(50023373,30023582,'2026-12-31', '11:00', '03:00', 0);
 --------
 INSERT INTO reviews
(user_id, restaurant_id, rating, comment)
VALUES
(80023372,60023274,20023682,5, 'Best biryani in Hyderabad!'),
(80023373,60023276,20023684,4, 'Authentic South Indian taste and good service.'),
(80023374,60023275,20023685,4, 'Great Mughlai food experience!'),
(80023375,60023277,20023687,5, 'Crispy and fresh chicken, excellent service!'),
(80023376,60023279,20023689,4, 'Authentic biryani taste, good portion size.');

select * from reviews;
----------------


select * from owners;
select * from restaurants;
select * from restaurant_branches;
select * from service_areas;
select * from timings;
select * from menu_items;
select * from orders;
select * from order_items;
select * from reviews;
select * from users;
select * from user_addresses;


-----Count total restaurants currently active on platform 
SELECT COUNT(*) AS total_active_restaurants FROM restaurants WHERE is_active = 1 AND is_deleted = 0 AND approval_status = 'approved';

----Fetch restaurants which are temporarily closed 
SELECT r.restaurant_name FROM restaurants r JOIN restaurant_branches rs ON  r.restaurant_id=rs.restaurant_id WHERE rs.is_temporarily_closed=1;

-----Get restaurant details along with total orders handled 
SELECT r.restaurant_name,COUNT(o.order_id) AS total_orders_handled FROM restaurants r LEFT JOIN restaurant_branches b ON r.restaurant_id = b.restaurant_id 
LEFT JOIN orders o ON b.branch_id = o.branch_id GROUP BY r.restaurant_name;


-----Update restaurant status to inactive 
UPDATE restaurants SET is_active=0 WHERE restaurant_id=20023689;


----Find restaurants which are open now and accepting orders 
SELECT DISTINCT r.restaurant_name FROM restaurants r JOIN restaurant_branches rb  ON r.restaurant_id=rb.restaurant_id 
WHERE r.is_active = 1 AND r.is_deleted = 0 AND r.approval_status = 'approved' AND r.is_accepting_orders = 1 AND rb.is_temporarily_closed = 0
AND CAST(created_at AS TIME)  BETWEEN rb.opening_time AND rb.closing_time;



