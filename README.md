# Laundy-Shop-Management
Oracle SQL Database Project

## Introduction

In the contemporary business landscape, efficient data management is pivotal for operational success. This holds particularly true for businesses like laundry shops, where a multitude of transactions occur daily. This document presents an in-depth analysis of the design and implementation of a relational database tailored for a laundry shop. By leveraging structured data storage and retrieval mechanisms, the laundry shop can streamline its operations, enhance customer service, and drive profitability.

## Project Overview

The project aims to develop a robust relational database system tailored specifically for managing the operations of a laundry shop. It encompasses the creation of tables to store essential data such as cloth details, client information, employee records, order details, and payment transactions. By organizing data in a structured format, the database facilitates seamless access, manipulation, and analysis of information critical for day-to-day operations.

## Importance of the Database in Laundry Shop

A well-designed database system is indispensable for the smooth functioning of a laundry shop. It serves as the backbone for organizing, storing, and retrieving critical information related to inventory, orders, clients, and payments. With a centralized database, the laundry shop can efficiently track inventory levels, manage customer orders, assign tasks to employees, and process payments in a timely manner. This not only streamlines operations but also enhances decision-making capabilities and enables the business to deliver high-quality services consistently.

## Project Objectives

In this project, the primary aim is to design a robust relational database schema tailored specifically for managing data related to laundry services. By creating a well-structured database, we intend to streamline the management of various aspects such as cloth types, client information, employee details, order details, and payment records. This database will serve as a centralized repository for all laundry-related data, facilitating efficient data organization and retrieval.

### Designing a Relational Database Schema for Managing Laundry-Related Data:

- Develop a structured database schema capable of efficiently storing and organizing data related to laundry services, including information about cloths, clients, employees, orders, and payments.
- Ensure data integrity and consistency by implementing appropriate constraints, such as primary keys, foreign keys, and data types, to enforce relational integrity and prevent inconsistencies.
- Design the schema to accommodate future scalability and flexibility requirements, allowing for easy expansion and modification as the business grows or evolves.

### Implementing SQL Queries for Retrieving, Updating, and Managing Data within the Database:

- Develop a set of SQL queries for performing various operations on the database, including retrieving information, updating records, inserting new data, and deleting obsolete or erroneous entries.
- Create queries to support essential functionalities such as adding new clients, processing orders, managing inventory, tracking payments, and generating reports for business analysis and decision-making.
- Optimize query performance through indexing, query optimization techniques, and efficient use of SQL features to ensure fast and responsive data access, especially for frequently executed operations.

## Database Design & Overview

The database schema of Laundry Shop Management consists of the following tables:

- **Cloths**: Stores information about different types of cloths including their type, color, size, and fabric type.
- **Clients**: Contains details about clients such as their names, contact information, and the cloth they have assigned.
- **Employees**: Stores information about employees including their names, contact details, and positions within the laundry shop.
- **OrderDetails**: Tracks the details of each order including the cloth ordered, client placing the order, employee handling the order, quantity, unit price, and subtotal.
- **Payment**: Stores payment details including payment ID, associated order ID, payment date, and amount paid.

### Rationale Behind the Design Decisions

The database schema is designed to capture all essential aspects of laundry management including inventory, orders, clients, employees, and payments. Each table is structured to minimize redundancy and maintain data integrity, ensuring accurate and reliable information retrieval.

### Normalization

Normalization was employed to eliminate data redundancy and dependency anomalies, thereby enhancing data integrity and minimizing storage space requirements. The tables are normalized up to the third normal form (3NF), ensuring efficient data management and reducing the risk of inconsistencies.

## SQL Queries and Functionality

SQL queries and functionality are indispensable components of our project, empowering users to seamlessly engage with the database. Here, we outline pivotal SQL queries and functionalities crucial for optimal system operation.

- **Data Retrieval**:
  - Retrieve Clients Information: `SELECT * FROM clients WHERE address = 'Khulna, Bangladesh';`
  - The Sum of the subtotal of a clients: `SELECT SUM(subtotal) AS total_subtotal FROM orderdetails WHERE clientid = 'x';`
  - The information of the client who paid the highest amount single transaction (using Nested query):

    ```sql
    SELECT * FROM clients WHERE clientid = (
    SELECT clientid FROM orderdetails WHERE unitprice = (
    SELECT MAX(unitprice) FROM orderdetails));
    ```

- **Add column**: `ALTER TABLE employees ADD age NUMBER;`

- **Searching**:
  - Find the clients whose firstname starts with 'T' and lastname with 'M': `SELECT * FROM clients WHERE firstname LIKE 'T%' AND lastname LIKE 'M%';`
  - Find the average age of employees grouped by their position, where the average age is greater than 32:

    ```sql
    SELECT position, AVG(age) AS avg_age FROM employees GROUP BY position HAVING AVG(age) > 32;
    ```

- **Update**: `UPDATE cloths SET clothtype = 'shirt', color = 'black', sizee = 'xl' WHERE clothid = 3;`

- **Advanced SQL Command**:
  - The eldest employee:

    ```sql
    SET serveroutput ON
    CREATE OR REPLACE FUNCTION find_eldest_employee RETURN VARCHAR2 IS
        eldest_employee_name VARCHAR2(100);
    BEGIN
        SELECT firstname || ' ' || lastname INTO eldest_employee_name
        FROM employees
        WHERE age = (SELECT MAX(age) FROM employees);

        RETURN eldest_employee_name;
    END;
    /
    DECLARE
        eldest_employee VARCHAR2(100);
    BEGIN
        eldest_employee := find_eldest_employee();
        dbms_output.put_line('The eldest employee is: ' || eldest_employee);
    END;
    /
    ```

- **Cloths Information**:

    ```sql
    SET serveroutput ON
    DECLARE 
        CURSOR cloth_cursor IS SELECT * FROM cloths;
        cloth_row cloths%ROWTYPE;
        row_counter NUMBER := 0;
    BEGIN
        OPEN cloth_cursor;
        FETCH cloth_cursor INTO cloth_row.clothid, cloth_row.clothtype, cloth_row.color, cloth_row.sizee, cloth_row.fabrictype;
        WHILE cloth_cursor%FOUND LOOP
            row_counter := row_counter + 1;
            dbms_output.put_line('Cloth ID: ' || cloth_row.clothid || ' Cloth Type: ' || cloth_row.clothtype || ' Color: ' || cloth_row.color || ' Size: ' || cloth_row.sizee || ' Fabric Type: ' || cloth_row.fabrictype);
            dbms_output.put_line('Row count: ' || row_counter);
            FETCH cloth_cursor INTO cloth_row.clothid, cloth_row.clothtype, cloth_row.color, cloth_row.sizee, cloth_row.fabrictype;
        END LOOP;
        CLOSE cloth_cursor;
    END;
    /
    ```

- **Update the order subtotal**:

    ```sql
    CREATE OR REPLACE TRIGGER update_order_subtotal
    BEFORE INSERT OR UPDATE OF quantity, unitprice ON orderdetails
    FOR EACH ROW
    BEGIN
        :NEW.subtotal := :NEW.quantity * :NEW.unitprice;
        UPDATE payment SET amount = :NEW.subtotal WHERE orderid = :NEW.orderid;
    END;
    /
    ```

### Advantages:

- Efficient data management facilitates organized storage and retrieval of critical information.
- Improved customer service results from centralized data management, enhancing order processing and inventory tracking.
- Enhanced operational efficiency is achieved through automation of processes like updating order subtotals.
- Scalability and flexibility are ensured with a designed schema allowing for easy expansion and modification.
- Data integrity and consistency are maintained through normalization and appropriate constraints.

### Disadvantages:

- Complexity of implementation requires careful planning and execution.
- Cost and resource intensiveness entail financial investment and skilled personnel.
- Potential for technical issues such as database errors or performance bottlenecks exists.
- Dependency on technology infrastructure may lead to disruptions or failures impacting operations.
- Training and adoption challenges may arise for employees unfamiliar with the system.

## Conclusion

In conclusion, the development and implementation of a relational database tailored for a laundry shop offer numerous benefits in terms of operational efficiency, data accuracy, and decision support. By centralizing data management processes, the database enables the laundry shop to optimize its operations, enhance customer satisfaction, and drive business growth. Moving forward, regular maintenance and updates will be essential to ensure the database remains aligned with evolving business needs and technological advancements.

## References

- [Laundry Management System Design and Implementation](https://www.academia.edu/41847521/Laundry_Management_System_Design_and_Implementation)
- [Free Projects: Laundry Management System Database Design](https://itsourcecode.com/free-projects/database-design-projects/laundry-management-system-database-design/)
- [Laundry Management System Capstone Project Document](https://capstoneguide.com/laundry-management-system-capstone-project-document/)
- [DrawSQL: Online Database Diagram Tool](https://drawsql.app/)

