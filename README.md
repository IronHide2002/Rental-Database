# Property Rental Database Project

## Project Overview

This project is a comprehensive database system designed for a Property Rental Agency. The system manages various aspects of property rental operations, including property information, user details, tenant management, and rent history. The database is implemented in MySQL and includes a set of stored procedures to streamline and automate key operations such as searching for properties, retrieving property records, and managing tenant details.

## Database Structure

### 1. **USERINFO Table**
   - **Purpose:** Stores information about the users of the system, which includes tenants, property owners, and managers.
   - **Columns:**
     - `Aid` (Primary Key): Unique identifier for each user (Its Aadhaar)
     - `userID`: User's unique ID.
     - `password`: User's password (stored in plain text for simplicity, but should be hashed in a real application).
     - `age`: Age of the user.
     - `Name`: Full name of the user.
     - `Dno`: Door number of the user's address.
     - `pincode`: Postal code of the user's address.
     - `state`, `city`, `street`: Address details of the user.
     - `isten`, `isown`, `isman`: Flags indicating if the user is a tenant, owner, or manager.
     - `phoneNum`: User's contact number.

### 2. **PROPINFO Table**
   - **Purpose:** Contains details about the properties available for rent.
   - **Columns:**
     - `propID` (Primary Key): Unique identifier for each property.
     - `plinth_Ar`: Plinth area of the property.
     - `TotAr`: Total area of the property.
     - `Year_of_Cons`: Year of construction.
     - `Addr`: Address of the property.
     - `No_of_floor`: Number of floors in the property.
     - `Date_avail`: Date when the property is available for rent.
     - `loc`: Location of the property.
     - `rpm`: Rent per month.
     - `No_of_rooms`: Number of rooms in the property.
     - `manid` (Foreign Key): Manager's ID from the USERINFO table.
     - `ownid` (Foreign Key): Owner's ID from the USERINFO table.
     - `is_resi`, `is_comer`: Flags indicating if the property is residential or commercial.

### 3. **tenantDet Table**
   - **Purpose:** Stores rental details for tenants.
   - **Columns:**
     - `ten_id` (Foreign Key): Tenant's ID from the USERINFO table.
     - `proid` (Foreign Key): Property ID from the PROPINFO table.
     - `stDate`: Start date of the rental period.
     - `EndDate`: End date of the rental period.
     - `Agency`: Agency handling the property (in this case, self-managed).
     - `rpm`: Rent per month.
     - `hike`: Percentage increase in rent.

## Stored Procedures

### 1. **SearchPropertyForRent**
   - **Purpose:** Allows users to search for properties available for rent in a specific locality.
   - **Input Parameter:** `locality` (VARCHAR)
   - **Output:** Details of properties available in the specified locality.

### 2. **GetPropertyRecords**
   - **Purpose:** Retrieves all property records owned by a specific user.
   - **Input Parameter:** `owid` (INT)
   - **Output:** Details of all properties owned by the user.

### 3. **GetTenantDetails**
   - **Purpose:** Fetches tenant details for a specific property.
   - **Input Parameter:** `pid` (INT)
   - **Output:** Tenant details, including name, age, phone number, and rental period.

### 4. **GetRentHistory**
   - **Purpose:** Provides a history of rent payments and rent hikes for a specific property.
   - **Input Parameter:** `propertyid` (INT)
   - **Output:** Rent history for the specified property.

### 5. **InsertPropertyRecord**
   - **Purpose:** Inserts a new property record into the database. Only authorized users (managers or owners) are allowed to perform this operation.
   - **Input Parameters:** Various property details including `Aid`, `PID`, `Floors`, `TA`, `PA`, `YR`, `DOOR`, `Street`, `City`, `State`, `Pincode`, `Hike`, `Rent`, `P_TYPE`, `Date`, `Rooms`, and `Manager`.
   - **Output:** Confirmation message indicating successful insertion of the property record.

### Example Queries
- To search for properties in a specific locality:
  ```sql
  CALL SearchPropertyForRent('Downtown');
  ```
- To retrieve property records owned by a user with `owid = 1`:
  ```sql
  CALL GetPropertyRecords(1);
  ```
- To fetch tenant details for a property with `pid = 2`:
  ```sql
  CALL GetTenantDetails(2);
  ```
- To get rent history for a property with `propertyid = 3`:
  ```sql
  CALL GetRentHistory(3);
  ```
- To insert a new property record:
  ```sql
  CALL InsertPropertyRecord(Aid, PID, Floors, TA, PA, YR, DOOR, Street, City, State, Pincode, Hike, Rent, P_TYPE, Date, Rooms, Manager);
  ```

Here's the properly formatted section for the Python Database Interaction in the README file:

---

## Python Database Interaction

This project includes Python scripts for interacting with the database, performing data analysis, and creating visualizations. Below is a guide on how to set up and use the Python integration.

### Connecting to the Database

To establish a connection to your MySQL database:

```python
import mysql.connector as my_sql

connection = my_sql.connect(
    host='localhost',
    user='root',
    password='mysql',
    database='rentalproperty'
)

cursor = connection.cursor()
```

### Querying the Database

Executing SQL queries and fetch results using the cursor:

```python
query = "SELECT * FROM PROPINFO;"
cursor.execute(query)
results = cursor.fetchall()
```

### Converting Results to a Pandas DataFrame

For data manipulation and analysis, converting the query results to a Pandas DataFrame:

```python
import pandas as pd

columns = [i[0] for i in cursor.description]
df = pd.DataFrame(results, columns=columns)
```

### Closing the Connection

To close the cursor and the connection when you're done:

```python
cursor.close()
connection.close()
```

---
