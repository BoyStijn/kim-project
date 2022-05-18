CREATE DATABASE demo;

USE demo;

CREATE TABLE `products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) DEFAULT '',
    `description` TEXT DEFAULT '',
    `price` DOUBLE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `orderdata` TEXT DEFAULT '',
    `voornaam` VARCHAR(255) DEFAULT '',
    `achternaam` VARCHAR(255) DEFAULT '',
    `adres` VARCHAR(255),
    `postcode` VARCHAR(10),
    `woonplaats` VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (`id`)
);

INSERT INTO products(title, description, price) VALUES("A", "this is a test", 0.6);
INSERT INTO products(title, description, price) VALUES("B", "this is a test", 0.7);
INSERT INTO products(title, description, price) VALUES("C", "this is a test", 0.8);
INSERT INTO products(title, description, price) VALUES("D", "this is a test", 0.9);
INSERT INTO products(title, description, price) VALUES("E", "this is a test", 1.0);
INSERT INTO products(title, description, price) VALUES("F", "this is a test", 1.1);
INSERT INTO products(title, description, price) VALUES("G", "this is a test", 1.2);
INSERT INTO products(title, description, price) VALUES("H", "this is a test", 1.3);
INSERT INTO products(title, description, price) VALUES("I", "this is a test", 1.4);
INSERT INTO products(title, description, price) VALUES("J", "this is a test", 1.5);
INSERT INTO products(title, description, price) VALUES("K", "this is a test", 1.6);
INSERT INTO products(title, description, price) VALUES("L", "this is a test", 1.7);
INSERT INTO products(title, description, price) VALUES("M", "this is a test", 1.8);
INSERT INTO products(title, description, price) VALUES("N", "this is a test", 1.9);
INSERT INTO products(title, description, price) VALUES("O", "this is a test", 2.0);
INSERT INTO products(title, description, price) VALUES("P", "this is a test", 2.1);
INSERT INTO products(title, description, price) VALUES("Q", "this is a test", 2.2);
INSERT INTO products(title, description, price) VALUES("R", "this is a test", 2.3);
INSERT INTO products(title, description, price) VALUES("S", "this is a test", 2.4);
INSERT INTO products(title, description, price) VALUES("T", "this is a test", 2.5);
INSERT INTO products(title, description, price) VALUES("U", "this is a test", 2.6);
INSERT INTO products(title, description, price) VALUES("V", "this is a test", 2.7);
INSERT INTO products(title, description, price) VALUES("W", "this is a test", 2.8);
INSERT INTO products(title, description, price) VALUES("X", "this is a test", 2.9);
INSERT INTO products(title, description, price) VALUES("Y", "this is a test", 3.0);
INSERT INTO products(title, description, price) VALUES("Z", "this is a test", 3.1);

SELECT * FROM products;


