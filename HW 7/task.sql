--1 
CREATE VIEW samBills
AS SELECT rs.first_name, rs.surname, rb.bill_date, rb.cust_name, rb.bill_total
FROM reststaff rs
INNER JOIN restbill rb
ON rb.waiter_no = rs.staff_no
WHERE rs.first_name = 'Sam';

--2
SELECT bill_total
FROM samBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals
AS SELECT rm.room_name, SUM(rb.bill_total) AS total_sum
FROM restroom_management rm
INNER JOIN restbill rb
ON rb.bill_date = rm.room_date
GROUP BY rm.room_name;

--4
CREATE VIEW teamTotals 
AS SELECT CONCAT(MIN(rs.first_name), ' ', MIN(rs.surname)) AS headwaiter_name, SUM(rb.bill_total) AS total_sum
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
JOIN restStaff head ON rs.headwaiter = head.staff_no
GROUP BY head.staff_no;