create database db_spring; -- Creates the new database
create user 'springuser'@'localhost' identified by 'springuser'; -- Creates the user
grant all on db_spring.* to 'springuser'@'localhost'; -- Gives all privileges to the new user on the newly created database