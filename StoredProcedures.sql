DELIMITER //

CREATE PROCEDURE SearchPropertyForRent(IN locality VARCHAR(100))
BEGIN
    DECLARE pid, plar, tar, yoc, nof, rent, nor, mid, oid, isr, isc INT;
    DECLARE aaa, dav VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    DECLARE poptab CURSOR FOR
        SELECT propID, plinth_Ar, TotAr, Year_of_Cons, Addr, No_of_floor, Date_avail, rpm, No_of_rooms, manid, ownid, is_resi, is_comer 
        FROM PROPINFO WHERE loc = locality;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN poptab;
    read_loop: LOOP
        FETCH poptab INTO pid, plar, tar, yoc, aaa, nof, dav, rent, nor, mid, oid, isr, isc;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Property Id:', pid, ' Plinth Area:', plar, ' Total Area:', tar, ' Year of Construction:', yoc, 
                      ' Address:', aaa, ' No of Floors:', nof, ' Date Available:', dav, ' Owner Id:', oid, 
                      ' Rent:', rent, ' No of Rooms:', nor, ' Manager Id:', mid, ' Commercial:', isc, ' Residential:', isr);
    END LOOP;
    CLOSE poptab;
END //

CREATE PROCEDURE GetPropertyRecords(IN owid INT)
BEGIN
    DECLARE pid, plar, tar, yoc, nof, rent, nor, mid, isr, isc INT;
    DECLARE aaa, dav, loc VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    DECLARE poptab CURSOR FOR
        SELECT propID, plinth_Ar, TotAr, Year_of_Cons, Addr, No_of_floor, Date_avail, loc, rpm, No_of_rooms, manid, is_resi, is_comer 
        FROM PROPINFO WHERE ownid = owid;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN poptab;
    read_loop: LOOP
        FETCH poptab INTO pid, plar, tar, yoc, aaa, nof, dav, loc, rent, nor, mid, isr, isc;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Property Id:', pid, ' Plinth Area:', plar, ' Total Area:', tar, ' Year of Construction:', yoc, 
                      ' Address:', aaa, ' No of Floors:', nof, ' Date Available:', dav, ' Locality:', loc, 
                      ' Rent:', rent, ' No of Rooms:', nor, ' Manager Id:', mid, ' Commercial:', isc, ' Residential:', isr);
    END LOOP;
    CLOSE poptab;
END //

CREATE PROCEDURE GetTenantDetails(IN pid INT)
BEGIN
    DECLARE a, c, g INT;
    DECLARE b, d, e, f VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    DECLARE www CURSOR FOR
        SELECT Aid, Name, age, phoneNum, stDate
        , EndDate, rpm 
        FROM USERINFO u 
        JOIN tenantDet t ON u.Aid = t.ten_id 
        WHERE proid = pid;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN www;
    read_loop: LOOP
        FETCH www INTO a, b, c, d, e, f, g;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Aid: ', a, ' Name: ', b, ' Age: ', c, ' Phone no: ', d, 
                      ' Start date: ', e, ' End Date: ', f, ' Rent: ', g);
    END LOOP;
    CLOSE www;
END //

CREATE PROCEDURE GetRentHistory(IN propertyid INT)
BEGIN
    DECLARE pid, tid, r, hi INT;
    DECLARE st, ed VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    DECLARE pop CURSOR FOR
        SELECT proid, ten_id, stDate, EndDate, rpm, hike 
        FROM tenantDet 
        WHERE proid = propertyid;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN pop;
    read_loop: LOOP
        FETCH pop INTO pid, tid, st, ed, r, hi;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Property Id: ', pid, ' Tenant Id: ', tid, ' Start Date: ', st, 
                      ' End Date: ', ed, ' Rent: ', r, ' Hike in rent: ', hi);
    END LOOP;
    CLOSE pop;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertPropertyRecord(
    IN Aid INT,
    IN PID INT,
    IN Floors INT,
    IN TA INT,
    IN PA INT,
    IN YR INT,
    IN DOOR INT,
    IN Street VARCHAR(100),
    IN City VARCHAR(100),
    IN State VARCHAR(100),
    IN Pincode INT,
    IN Hike INT,
    IN Rent INT,
    IN P_TYPE INT,
    IN Bed INT
)
BEGIN
    DECLARE M INT DEFAULT 0;

    -- Check if the user is a manager or owner
    SELECT isman INTO M FROM USERINFO WHERE Aid = Aid;

    IF (M = 1) THEN
        -- Insert the property into the PROPINFO table
        INSERT INTO PROPINFO (propID, No_of_floor, TotAr, plinth_Ar, Year_of_Cons, Addr, No_of_rooms, loc, rpm, manid, ownid, is_resi, is_comer)
        VALUES (PID, Floors, TA, PA, YR, CONCAT(Street, ', ', City, ', ', State, ', ', Pincode), Bed, City, Rent, Aid, Aid, IF(P_TYPE = 1, 1, 0), IF(P_TYPE = 2, 1, 0));

        -- Insert the ownership record into tenantDet table
        INSERT INTO tenantDet (ten_id, proid, stDate, EndDate, Agency, rpm, hike)
        VALUES (Aid, PID, CURDATE(), NULL, 'Self', Rent, Hike);

        -- Update the user's ownership status
        UPDATE USERINFO SET isown = 1 WHERE Aid = Aid;

        SELECT 'Property record inserted successfully.' AS Result;

    ELSE
        -- If the user is not a manager or owner, insertion is not allowed
        SELECT 'INSERT NOT POSSIBLE. User is not authorized.' AS Result;
    END IF;
END //

DELIMITER ;
