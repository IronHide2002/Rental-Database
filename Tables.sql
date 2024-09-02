-- create database rentalproperty;
-- use rentalproperty;

CREATE TABLE USERINFO (
    Aid INT PRIMARY KEY,
    userID INT,
    password VARCHAR(100),
    age INT,
    Name VARCHAR(100),
    Dno INT,
    pincode INT,
    state VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    isten INT,
    isown INT,
    isman INT,
    phoneNum VARCHAR(100) NOT NULL
);

CREATE TABLE PROPINFO (
    propID INT PRIMARY KEY,
    plinth_Ar INT NOT NULL,
    TotAr INT NOT NULL,
    Year_of_Cons INT NOT NULL,
    Addr VARCHAR(100),
    No_of_floor INT,
    Date_avail DATE,
    loc VARCHAR(100),
    rpm INT,
    No_of_rooms INT,
    manid INT,
    ownid INT,
    is_resi INT,
    is_comer INT,
    FOREIGN KEY (manid) REFERENCES USERINFO(Aid),
    FOREIGN KEY (ownid) REFERENCES USERINFO(Aid)
);

CREATE TABLE tenantDet (
    ten_id INT,
    proid INT,
    stDate DATE,
    EndDate DATE,
    Agency VARCHAR(100),
    rpm INT,
    hike INT,
    FOREIGN KEY (ten_id) REFERENCES USERINFO(Aid),
    FOREIGN KEY (proid) REFERENCES PROPINFO(propID)
);
