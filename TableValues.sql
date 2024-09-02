INSERT INTO USERINFO (Aid, userID, password, age, Name, Dno, pincode, state, city, street, isten, isown, isman, phoneNum) VALUES
(1001, 501, 'password123', 30, 'John Doe', 12, 560001, 'Karnataka', 'Bangalore', 'MG Road', 1, 1, 1, '9876543210'),
(1002, 502, 'password456', 25, 'Jane Smith', 34, 560002, 'Karnataka', 'Bangalore', 'Brigade Road', 0, 0, 0, '8765432109'),
(1003, 503, 'password789', 35, 'Michael Johnson', 56, 560003, 'Karnataka', 'Bangalore', 'Church Street', 1, 1, 0, '7654321098'),
(1004, 504, 'password321', 28, 'Emily Davis', 78, 560004, 'Karnataka', 'Bangalore', 'Ulsoor', 0, 0, 1, '6543210987'),
(1005, 505, 'password654', 32, 'Chris Brown', 90, 560005, 'Karnataka', 'Bangalore', 'Jayanagar', 1, 1, 0, '5432109876'),
(1006, 506, 'password987', 27, 'Jessica Williams', 112, 560006, 'Karnataka', 'Bangalore', 'Koramangala', 0, 0, 1, '4321098765'),
(1007, 507, 'password159', 40, 'Daniel Wilson', 134, 560007, 'Karnataka', 'Bangalore', 'Indiranagar', 1, 1, 0, '3210987654'),
(1008, 508, 'password258', 29, 'Sarah Taylor', 156, 560008, 'Karnataka', 'Bangalore', 'Whitefield', 0, 0, 1, '2109876543'),
(1009, 509, 'password357', 33, 'David Martinez', 178, 560009, 'Karnataka', 'Bangalore', 'Marathahalli', 1, 1, 0, '1098765432'),
(1010, 510, 'password468', 31, 'Laura Garcia', 200, 560010, 'Karnataka', 'Bangalore', 'Bellandur', 0, 0, 1, '0987654321');

INSERT INTO PROPINFO (propID, plinth_Ar, TotAr, Year_of_Cons, Addr, No_of_floor, Date_avail, loc, rpm, No_of_rooms, manid, ownid, is_resi, is_comer) VALUES
(2001, 1200, 1800, 2015, 'MG Road, Bangalore, Karnataka, 560001', 5, '2024-09-01', 'Bangalore', 20000, 3, 1001, 1001, 1, 0),
(2002, 900, 1300, 2018, 'Brigade Road, Bangalore, Karnataka, 560002', 3, '2024-10-01', 'Bangalore', 15000, 2, 1002, 1002, 1, 0),
(2003, 1500, 2200, 2017, 'Church Street, Bangalore, Karnataka, 560003', 4, '2024-11-01', 'Bangalore', 25000, 4, 1003, 1003, 1, 0),
(2004, 1100, 1600, 2020, 'Ulsoor, Bangalore, Karnataka, 560004', 2, '2024-12-01', 'Bangalore', 12000, 3, 1004, 1004, 1, 0),
(2005, 950, 1400, 2016, 'Jayanagar, Bangalore, Karnataka, 560005', 6, '2024-09-15', 'Bangalore', 17000, 2, 1005, 1005, 1, 0),
(2006, 1300, 2000, 2019, 'Koramangala, Bangalore, Karnataka, 560006', 3, '2024-10-15', 'Bangalore', 23000, 3, 1006, 1006, 1, 0),
(2007, 1400, 2100, 2021, 'Indiranagar, Bangalore, Karnataka, 560007', 5, '2024-11-15', 'Bangalore', 24000, 4, 1007, 1007, 1, 0),
(2008, 1000, 1500, 2018, 'Whitefield, Bangalore, Karnataka, 560008', 2, '2024-12-15', 'Bangalore', 14000, 2, 1008, 1008, 1, 0),
(2009, 1250, 1900, 2020, 'Marathahalli, Bangalore, Karnataka, 560009', 4, '2024-09-30', 'Bangalore', 20000, 3, 1009, 1009, 1, 0),
(2010, 1150, 1700, 2022, 'Bellandur, Bangalore, Karnataka, 560010', 6, '2024-10-30', 'Bangalore', 18000, 2, 1010, 1010, 1, 0);

INSERT INTO tenantDet (ten_id, proid, stDate, EndDate, Agency, rpm, hike) VALUES
(1001, 2001, '2024-09-01', '2025-08-31', 'Self', 20000, 5),
(1002, 2002, '2024-10-01', '2025-09-30', 'Self', 15000, 3),
(1003, 2003, '2024-11-01', '2025-10-31', 'Self', 25000, 6),
(1004, 2004, '2024-12-01', '2025-11-30', 'Self', 12000, 2),
(1005, 2005, '2024-09-15', '2025-09-14', 'Self', 17000, 4),
(1006, 2006, '2024-10-15', '2025-10-14', 'Self', 23000, 7),
(1007, 2007, '2024-11-15', '2025-11-14', 'Self', 24000, 8),
(1008, 2008, '2024-12-15', '2025-12-14', 'Self', 14000, 3),
(1009, 2009, '2024-09-30', '2025-09-29', 'Self', 20000, 5),
(1010, 2010, '2024-10-30', '2025-10-29', 'Self', 18000, 6);
