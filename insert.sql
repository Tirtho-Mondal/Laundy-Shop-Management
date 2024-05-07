insert into cloths (clothid, clothtype, color, sizee, fabrictype) values(1, 'T-Shirt', 'Blue', 'M', 'Cotton');
insert into cloths (clothid, clothtype, color, sizee, fabrictype) values(2, 'Jeans', 'Black', '32', 'Denim');
insert into cloths (clothid, clothtype, color, sizee, fabrictype) values(3, 'Dress Shirt', 'White', 'L', 'Cotton');
insert into cloths (clothid, clothtype, color, sizee, fabrictype) values(4, 'Skirt', 'Red', 'S', 'Polyester');
insert into cloths (clothid, clothtype, color, sizee, fabrictype) values(5, 'Sweater', 'Gray', 'XL', 'Wool');

insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(1, 3, 'Mahfuz', 'Ahmed', '01722222211', 'Dhaka, Bangladesh');
insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(2, 4, 'Sabrina', 'Islam', '01733333322', 'Chittagong, Bangladesh');
insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(3, 5, 'Alamgir', 'Hossain', '01744444411', 'Khulna, Bangladesh');
insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(4, 1, 'Tasnima', 'Akhtar', '017555555354', 'Rajshahi, Bangladesh');
insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(5, 2, 'Abu', 'Bakar', '01766666896', 'Sylhet, Bangladesh');

insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(6, 2, 'Tirtho', 'Mondal', '01744444421', 'Khulna, Bangladesh');
insert into clients (clientid, clothid, firstname, lastname, phonenumber, address) values(7, 3, 'Turjyo', 'Mondal', '01744444431', 'Khulna, Bangladesh');
insert into employees (employeeid, firstname, lastname, position, phonenumber, email) values(1, 'Jubayer', 'Alam', 'Manager', '01711361111', 'jubayer@example.com');
insert into employees (employeeid, firstname, lastname, position, phonenumber, email) values(2, 'Mohammad', 'Islam', 'Sales Associate', '017122221', 'mohammad@example.com');
insert into employees (employeeid, firstname, lastname, position, phonenumber, email) values(3, 'Sani', 'Akhtar', 'Cashier', '01713334533', 'sani@example.com');
insert into employees (employeeid, firstname, lastname, position, phonenumber, email) values(4, 'Jakir', 'Hossain', 'Stock Clerk', '01714444467', 'jakir@example.com');
insert into employees (employeeid, firstname, lastname, position, phonenumber, email) values(5, 'Faruk', 'Ahmed', 'Assistant Manager', '01715555345', 'faruk@example.com');

insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values (1, 1, 1, 1, 2, 19.99, 39.98);
insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values(2, 2, 2, 2, 1, 29.99, 29.99);
insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values(3, 3, 3, 3, 3, 39.99, 119.97);
insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values(4, 4, 4, 4, 1, 49.99, 49.99);
insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values(5, 5, 5, 5, 2, 59.99, 119.98);

insert into payment (paymentid, orderid, paymentdate, amount) values(1, 1, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 39.98);
insert into payment (paymentid, orderid, paymentdate, amount) values(2, 2, TO_DATE('2024-04-27', 'YYYY-MM-DD'), 29.99);
insert into payment (paymentid, orderid, paymentdate, amount) values(3, 3, TO_DATE('2024-04-28', 'YYYY-MM-DD'), 119.97);
insert into payment (paymentid, orderid, paymentdate, amount) values(4, 4, TO_DATE('2024-04-29', 'YYYY-MM-DD'), 49.99);
insert into payment (paymentid, orderid, paymentdate, amount) values(5, 5, TO_DATE('2024-04-30', 'YYYY-MM-DD'), 119.98);




--
insert into orderdetails (orderid, clothid, clientid, employeeid, quantity, unitprice, subtotal) values(6, 2, 1, 3, 2, 9.99, 19.98);