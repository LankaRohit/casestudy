=>Inserting multiple row at a time
insert into menu_item (Id,Name,Price,Active,Date_of_Launch,Category,free_delivery)
values 
(1,'Egg Fried Rice',150.0,1,'2017-06-06','Main Course',1),
(2,'Veg Biryani,135.5,1,'2017-05-12','Main Course',0),
(3,'Thali',195,1,'2016-07-13','Main-Course',1),
(4,'Egg Briyani',175.25,1,'2008-06-12','Main-Course',1),
(5,'PineApple Juice',12.5,1,'2011-04-01','Drink',0),
(6,'Butter Milk',15.0,1,'2019-02-11','Drink',1),
(7,'Sandwich',12.0,1,'2011-02-11','Dessert',0),
(8,'Pizzaa',29.0,0,'2017-03-24','Dessert',1),
(9,'Rasmalayi',19.5,1,'2019-09-17','Dessert',1),
(10,'Maggie',69.5,0,'2022-04-01','Starter',1);

=>Admin menu item
select * from menu_item;

=>Update price by its product id
update menu_item set Price=149.0 where Id=1;

=>Select all menu item which is active and date of launch is prior
select Name,Price,Category,free_delivery from menu_item where Active=1 and Date_of_Launch<'2020-04-12';

=>Alter menu_item column change data type
alter table menu_item alter column Date_of_Launch date;

=>Create customer table
create table customer(id int identity(1,1) primary key, name varchar(50) not null);

=>Insert value into cart table
insert into customer values('john'),('jack'),('jill');

=>Select all customer from customer table
select * from customer;


=>Creating cart table reference with customer and menu_item table
create table cart(id int identity(1,1) primary key,
productId int references menu_item(id),
customerId int references customer(id));

=>Inserting value into cart table
insert into cart values (4,2),(3,1),(3,1),(7,3),(5,1),(4,3);

=>Selecting all data from cart table
select * from cart;

=>Group by productId by no of customer buys
select c.productId, count(c.customerId) As NoCustomer from cart c
group by c.productId;

=>View cart item based on customer Id
select m.Name as Item_Name,m.Price,count(m.Name) as Qty,m.free_delivery from menu_item  m
inner join cart c
on c.productId=m.Id 
join customer cus
on cus.id=c.customerId and cus.id=1
group by cus.name,m.Name,m.Price,m.Id,m.free_delivery
order by cus.name;