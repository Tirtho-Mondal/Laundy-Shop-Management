--Insert data in Cloths using PL/SQL
set serveroutput on
declare
    cloth_id cloths.clothid%type := 6;
    cloth_type cloths.clothtype%type := 'Pant';
    cloth_color cloths.color%type := 'blue';
    cloth_size cloths.sizee%type := 'xxl';
    fabric_type cloths.fabrictype%type := 'lineel';
begin
    insert into cloths (clothid, clothtype, color, sizee, fabrictype)
    values (cloth_id, cloth_type, cloth_color, cloth_size, fabric_type);
end;
/




--Showing the information of the cloths(using row counter and course)
set serveroutput on
declare 
    cursor cloth_cursor is select * from cloths;
    cloth_row cloths%rowtype;
    row_counter number := 0;
begin
    open cloth_cursor;
    fetch cloth_cursor into cloth_row.clothid, cloth_row.clothtype, cloth_row.color, cloth_row.sizee, cloth_row.fabrictype;
    while cloth_cursor%found loop
        row_counter := row_counter + 1;
        dbms_output.put_line('Cloth ID: ' || cloth_row.clothid || ' Cloth Type: ' || cloth_row.clothtype || ' Color: ' || cloth_row.color || ' Size: ' || cloth_row.sizee || ' Fabric Type: ' || cloth_row.fabrictype);
        dbms_output.put_line('Row count: ' || row_counter);
        fetch cloth_cursor into cloth_row.clothid, cloth_row.clothtype, cloth_row.color, cloth_row.sizee, cloth_row.fabrictype;
    end loop;
    close cloth_cursor;
end;
/

--Find the eldest employee using PL/SQL(using function)
set serveroutput on
create or replace function find_eldest_employee return varchar2 is
    eldest_employee_name varchar2(100);
begin
    select firstname || ' ' || lastname into eldest_employee_name
    from employees
    where age = (select max(age) from employees);

    return eldest_employee_name;
end;
/
declare
    eldest_employee varchar2(100);
begin
    eldest_employee := find_eldest_employee();
    dbms_output.put_line('The eldest employee is: ' || eldest_employee);
end;
/



--Display the Clients name using array, loop and extend() function
set serveroutput on
declare 
  counter number;
  client_name clients.firstname%type;
  client_lastname clients.lastname%type;
  type namearray is varray(100) of varchar2(100); 
  client_names namearray:=namearray();
begin
  counter:=1;
  for client_rec in (select firstname, lastname from clients)  
  loop
    client_names.extend();
    client_names(counter):= client_rec.firstname || ' ' || client_rec.lastname;
    counter:=counter+1;
  end loop;
  counter:=1;
  while counter<=client_names.count 
  loop 
    dbms_output.put_line(client_names(counter)); 
    counter:=counter+1;
  end loop;
end;
/ 



--Disply the cloth with the crosponding clients. PL/SQL
set serveroutput on
create or replace procedure display_cloth_with_client as
    cursor cloth_client_cur is
        select c.clothid, c.clothtype, c.color, c.sizee, c.fabrictype, cl.firstname, cl.lastname
        from cloths c
        join clients cl on c.clothid = cl.clothid;
begin
    dbms_output.put_line('clothid | clothtype   | color | size | fabrictype | client firstname | client lastname');
    dbms_output.put_line('-----------------------------------------------------------------------------');
    for cloth_client_rec in cloth_client_cur loop
        dbms_output.put_line(
            cloth_client_rec.clothid || ' | ' || 
            cloth_client_rec.clothtype || ' | ' || 
            cloth_client_rec.color || ' | ' || 
            cloth_client_rec.sizee || ' | ' || 
            cloth_client_rec.fabrictype || ' | ' || 
            cloth_client_rec.firstname || ' | ' || 
            cloth_client_rec.lastname
        );
    end loop;
end;
/
begin
    display_cloth_with_client;
end;
/

--how to drop the function and procedure ?
drop function find_eldest_employee;    drop procedure display_cloth_with_client


--Trigger to update order subtotal when quantity or unit price changes in orderdetails and payment table
create or replace trigger update_order_subtotal
before insert or update of quantity, unitprice on orderdetails
for each row
begin
    :NEW.subtotal := :NEW.quantity * :NEW.unitprice;
    update payment set amount = :NEW.subtotal WHERE orderid = :NEW.orderid;
end;
/

--select * from payment;
--select * from orderdetails;
--update  orderdetails  set  quantity = 5 where orderid=2;


--How to drop trigger ?
drop trigger update_order_subtotal




