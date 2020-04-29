CREATE TABLE users  (
    id_user int IDENTITY(1,1) PRIMARY KEY,
    username varchar(50) NOT NULL,
    password varchar(128) NOT NULL,
    firstname varchar(250) NOT NULL,
    lastname varchar(250) NOT NULL,
    phonenumber varchar(12) NOT NULL,
    role int NOT NULL,
    email varchar(250) NOT NULL,
);

ALTER TABLE users
    ADD UNIQUE (username, phonenumber, email);


CREATE TABLE categories (
    id_category int IDENTITY(1,1) PRIMARY KEY,
    name_category varchar(250) NOT NULL,
    desc_category text NOT NULL,
    logo varchar(max) NOT NULL,
);

ALTER TABLE categories
    ADD UNIQUE (name_category);

CREATE TABLE brands (
    id_brand int IDENTITY(1,1) PRIMARY KEY,
    name_brand varchar(250) NOT NULL,
    desc_brand text NOT NULL,
    logo varchar(max) NOT NULL,
);

ALTER TABLE brands
    ADD UNIQUE (name_brand);


CREATE TABLE products (
    id_category int NOT NULL,
    id_brand int NOT NULL,
    id_product int IDENTITY(1,1) PRIMARY KEY,
    name_product varchar(250) NOT NULL,
    desc_product text NOT NULL,
    stock int NOT NULL,
    price decimal NOT NULL,
    image varchar(max) NOT NULL,
);

ALTER TABLE products
    ADD UNIQUE (name_product);

ALTER TABLE products
    ADD FOREIGN KEY (id_brand) REFERENCES brands(id_brand);

ALTER TABLE products
    ADD FOREIGN KEY (id_category) REFERENCES categories(id_category);


CREATE TABLE cart_items (
    cart_item_id int IDENTITY(1,1) PRIMARY KEY,
    quantity_in_cart int NOT NULL,
    id_user int NOT NULL,
    id_product int NOT NULL,
);

ALTER TABLE cart_items
    ADD FOREIGN KEY (id_user) REFERENCES users(id_user);

ALTER TABLE cart_items
    ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

CREATE TABLE orders (
    id_user int NOT NULL,
    id_order int IDENTITY(1,1) PRIMARY KEY,
    ordered_at datetime NOT NULL,
    status int NOT NULL,
);

ALTER TABLE orders
    ADD FOREIGN KEY (id_user) REFERENCES users(id_user);

CREATE TABLE order_items (
    order_item_id int IDENTITY(1,1) PRIMARY KEY,
    quantity_in_order int NOT NULL,
    id_order int NOT NULL,
    id_product int NOT NULL,
);

ALTER TABLE order_items
    ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

ALTER TABLE order_items
    ADD FOREIGN KEY (id_order) REFERENCES orders(id_order);