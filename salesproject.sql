/*CREATE A DATA BASE*/
create database sales;

/*SELECT DATABASE*/
use sales;

/*CREATE A TABLE*/
create table product(
product_name varchar(20),
product_id varchar(10),
product_price int(5),
product_expiry_date date,
product_quality varchar(10),
product_type varchar(15),
primary key(product_id)
);

/*SELECT ALL ELEMENTS*/
select * from product;

/*DELETE THE TABLE*/
drop table product;

/*INSERT IN PRODUCT TABLE*/
insert into product values("Mirch snack","sna1",35,"2021-12-1","Good","Snack");
insert into product values("Mint Paste","tp1",100,"2021-11-1","Good","ToothPaste");
insert into product values("Apple Juice","jui1",35,"2021-12-1","Good","Juice");
insert into product values("Ice Soda","jui2",35,"2021-12-1","Good","Juice");
insert into product values("Tiger Snack","sna2",35,"2021-08-1","Bad","Snack");
insert into product values("Regular Paste","tp2",35,"2021-10-1","Normal","ToothPaste");
insert into product values("Cream Mountain","bis1",10,"2022-1-1","Good","Biscuit");
insert into product values("Ice Mountain","bis2",15,"2021-07-1","Bad","Biscuit");

/*DELETE ALL RECORDS OF A TABLE*/
truncate table product;

/*UPDATION IN A TABLE*/
update product set product_name="Ice Biscuit" where product_id="bis2";

/*SELECT PARTICULAR COLUMNS*/
select product_name,product_price,product_quality from product;

/*SELECT ALL COLUMNS OF GOOD PRODUCT QUALITY*/
select * from product where product_quality="Good";

/*SELECT ALL COLUMNS OF BAD PRODUCT QUALITY*/
select * from product where product_quality="Bad";

/*SELECT ALL COLUMNS OF SNACK PRODUCT TYPE*/
select * from product where product_type="Snack";

/*SELECT PARTICULAR COLUMNS OF GOOD PRODUCT QUALITY*/
select product_name,product_price from product where product_quality="Good";

/*SELECT STARTING 4 ROWS*/
select * from product limit 4;

/*SELECT ALL COLUMNS OF THOSE PRODUCT WHOSE EXPIRY DATE BEFORE 2022*/
select * from product where product_expiry_date<"2022-01-01";

/*SELECT ALL COLUMNS OF THOSE PRODUCT WHOSE EXPIRY DATE AFTER 2021*/
select * from product where product_expiry_date>"2021-12-31";

/*COUNT TOTAL NUMBER OF ROWS AS TOTAL NUMBER OF ROWS*/
select count(*) as total_number_of_rows from product;

/*COUNT TOTAL NUMBER OF ROWS AS TOTAL NUMBER OF ROWS GROUPING BY PRODUCT QUALITY*/
select count(*) as total_number_of_rows,product_quality from product group by product_quality;

/*SUM OF PRICE AS TOTAL PRICE*/
select sum(product_price) as total_price from product;

/*SUM TOTAL PRICE AS TOTAL PRICE GROUPING BY PRODUCT QUALITY*/
select sum(product_price) as total_number_of_rows,product_quality from product group by product_quality;

/*MAX VALUE OF PRICE AS MAX PRICE*/
select max(product_price) as max_price from product;

/*MAX PRICE AS MAX PRICE GROUPING BY PRODUCT QUALITY*/
select max(product_price) as max_price,product_quality from product group by product_quality;

/*MIN VALUE OF PRICE AS MIN PRICE*/
select min(product_price) as min_price from product;

/*MIN PRICE AS MIN PRICE GROUPING BY PRODUCT QUALITY*/
select min(product_price) as min_price,product_quality from product group by product_quality;

/*CHECKING NULL ROWS IN PRODUCT NAME COLUMN*/
select * from product where product_name is null;

/*SELECT ALL COLUMNS BY ASCENDING ORDER BY PROUDUCT PRICE*/
select * from product order by product_price;

/*SELECT ALL COLUMNS BY DESCENDING ORDER BY PROUDUCT PRICE*/
select * from product order by product_price desc;

/*CREATING ANOTHER TABLE*/
create table sold_product(
sale_id varchar(10),
product_id varchar(10) unique,
sold_date date,
primary key(sale_id)
);

/*INSERTING THE VALUES*/
insert into sold_product values("sal1","tp1","2021-04-23");
insert into sold_product  values("sal2","tp2","2021-04-20");
insert into sold_product  values("sal3","bis1","2020-12-23");
insert into sold_product  values("sal4","bis3","2021-05-20");
insert into sold_product  values("sal5","jui1","2021-02-23");
insert into sold_product  values("sal6","jui9","2020-11-23");
insert into sold_product  values("sal7","sna1","2021-04-01");
insert into sold_product  values("sal8","sna5","2021-03-05");

/*SELECT ALL COLUMNS OF SOLD_PRODUCT*/
select * from sold_product;

/*DELETION IN A TABLE*/
delete from sold_product where sale_id="sal11";
delete from sold_product where sale_id="sal10";

/*SELECT COLUMNS OF PRODUCT TABLE AND SALE TABLE IN WHICH PRODUCT ARE SOLD*/
select * from product as pro
inner join sold_product as sal
where pro.product_id=sal.product_id;

/*ROLLBACK*/
commit;
insert into sold_product values("sal9","bis4","2021-01-01");
rollback;

/*REGULAR EXPRESSION*/
/*SELECT ALL COLUMNS FROM PRODUCT IN WHICH PRODUCT NAME HAVE NA*/
select * from product where product_name regexp "na";

/*SELECT ALL COLUMNS FROM PRODUCT IN WHICH PRODUCT NAME HAVE m*/
select * from product where product_name regexp "m";

/*SELECT ALL COLUMNS FROM PRODUCT IN WHICH PRODUCT NAME STARTS FROM m*/
select * from product where product_name regexp "^m";

/*SELECT ALL COLUMNS FROM PRODUCT IN WHICH PRODUCT NAME STARTS FROM Ic*/
select * from product where product_name regexp "^Ic";

/*SELECT ALL COLUMNS FROM PRODUCT IN WHICH PRODUCT NAME END FROM it*/
select * from product where product_name regexp "it$";

/*INDEXING*/
create index demo on product (product_expiry_date);

select * from product where product_expiry_date>"2021-07-01";

/*SHOW INDEXES*/
show index from product;

/*DROP INDEX*/
drop index demo on product;




