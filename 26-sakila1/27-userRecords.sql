/*1*/
CREATE SCHEMA `hackerhero_practice`;
USE hackerhero_practice;
CREATE TABLE `Users` (
	id bigint NOT NULL auto_increment,
    first_name varchar(255) NULL,
    last_name varchar(255) NULL,
    email varchar(255) NULL,
    encrypted_password varchar(255),
    created_at datetime  default CURRENT_TIMESTAMP,
	updated_at datetime,
    primary key (id)
);
/*2*/
INSERT INTO Users (first_name, last_name, email, encrypted_password) 
VALUES ('Bien', 'Lim', 'bienlim@gmail', '12345');
INSERT INTO Users (first_name, last_name, email, encrypted_password) 
VALUES ('Bob', 'boo', 'bobboo@gmail', 'asdfg'),('Dina', 'Talaga', 'Kaya@gmail', 'payts');
/*3*/
UPDATE users set first_name='christian' Where id=1;
/*4*/
Update users set first_name='christian'  WHERE last_name='choi';
/*5*/
Update users set first_name='christian'  WHERE  id in ('3','5','7','12','19');
/*6*/
DELETE FROM users WHERE id=1;
/*7*/
DELETE From users;
/*8*/
DROP TABLE users; /*Dropping table will delete the table with all its records. Deleting all record will keep the table */
/*9*/
ALTER TABLE users  RENAME COLUMN email TO email_address; 
/*10*/
ALTER TABLE users  CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;
/*11*/
ALTER TABLE users ADD COLUMN `is_active` BOOLEAN NOT NULL default 0; 
select * from  users WHERE  id in ('3','5','7','12','19') and is_active=1;
