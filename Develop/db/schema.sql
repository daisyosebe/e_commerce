-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- USE DATABASE
\c ecommerce_db;

-- CREATE TABLE categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

-- CREATE TABLE products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  stock INTEGER NOT NULL DEFAULT 10,
  category_id INTEGER REFERENCES categories(id)
);

-- CREATE TABLE tags
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(50) NOT NULL
);

-- CREATE TABLE product_tags
CREATE TABLE product_tags (
  id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES products(id),
  tag_id INTEGER REFERENCES tags(id)
);
