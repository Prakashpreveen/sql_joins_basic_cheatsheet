-- Create Database:
create database joins;
use joins;

-- Sample Data: (ADD COLUMNS AS MUCH AS NEEDED)
-- (TABLE-1) 
create table artist_table (
artist_id int primary key auto_increment,
name varchar(255) not null
);

-- (TABLE-2)
create table album_table (
album_id int primary key auto_increment,
title varchar(255) not null,
artist_id int
);