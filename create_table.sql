create table cloths (
    clothid int primary key,
    clothtype varchar(50),
    color varchar(50),
    sizee varchar(20),
    fabrictype varchar(50)
);

create table clients (
    clientid int primary key,
    clothid int,
    firstname varchar(50),
    lastname varchar(50),
    phonenumber varchar(20),
    address varchar(255),
    foreign key (clothid) references cloths(clothid)
);

create table employees (
    employeeid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    position varchar(50),
    phonenumber varchar(20),
    email varchar(100)
);

create table orderdetails (
    orderid int primary key,
    clothid int,
    clientid int,
    employeeid int,
    quantity int,
    unitprice decimal(10, 2),
    subtotal decimal(10, 2),
    foreign key (clothid) references cloths(clothid),
    foreign key (clientid) references clients(clientid),
    foreign key (employeeid) references employees(employeeid)
);

create table payment (
    paymentid int primary key,
    orderid int,
    paymentdate date,
    amount decimal(10, 2),
    foreign key (orderid) references orderdetails(orderid)
);