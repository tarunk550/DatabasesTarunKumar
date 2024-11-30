--1 

SELECT t1.cust_name FROM restBill t1
WHERE t1.bill_total> 450.00 AND t1.waiter_no IN(
    SELECT t1.waiter_no
    FROM restBill, restStaff t2
    WHERE t2.headwaiter= 010 AND t2.staff_no = t1.waiter_no);
    
--2

SELECT t1.first_name, t1.surname FROM restStaff t1
WHERE t1.staff_no IN(
    SELECT t1.headwaiter FROM restStaff t1
    WHERE t1.staff_no IN(
        SELECT t1.staff_no
        FROM restBill t2
        WHERE t2. waiter_no= t1.staff_no AND bill_date= "160111" AND cust_name= "Nerida Smith")
);

--3

SELECT cust_name FROM restBill 
WHERE restBill. bill_total IN (
    SELECT MIN(bill_total)
    FROM restBill
);

--4

SELECT t1.first_name, t1. surname FROM restStaff t1
WHERE t1.staff_no NOT IN(
    SELECT t2.waiter_no 
    FROM restBill t2
);

--5

SELECT cust_name, h.first_name, h.surname, room_name
FROM restbill
JOIN reststaff s ON restbill.waiter_no = s.staff_no
JOIN restrest_table ON restbill.table_no = restrest_table.table_no
INNER JOIN reststaff h ON s.headwaiter = h.staff_no

WHERE bill_total = (
    SELECT MAX(bill_total)
    FROM restbill
)
AND s.headwaiter = h.staff_no;
   
-- (Failed attempt):
-- SELECT t1.cust_name, t2.first_name, t2.surname, t3.room_name FROM restBill t1, restStaff t2, restRoom_management t3, restRest_table t4
-- WHERE t2.surname IN(
--    SELECT t2.surname FROM t2.restStaff
--    WHERE t2.first_name IN(
--        SELECT first_name FROM t2.restStaff, restRoom_management t3
--        WHERE t2.staff_no IN(
--            SELECT t2.headwaiter FROM restRoom_management t3, restStaff t2
--            WHERE t2.headwaiter= t3.headwaiter AND t3.headwaiter IN(
--                SELECT t3.room_name FROM restRoom_management t3, restRest_table t4
--                WHERE t3.room_name= t4.room_name AND t4.room_name IN(
--                    SELECT t4.room_name FROM restBill t1, restRest_table t4 
--                    WHERE t1.table_no= t4.table_no AND t1. bill_total IN (
--                         SELECT MAX(t1.bill_total)
--                        FROM restBill t1, restRest_table t4
--                        ))))));







