CREATE DATABASE mysql_database;

CREATE TABLE sales_records (
    region VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    itemtype VARCHAR(255) NOT NULL,
    saleschannel VARCHAR(255) NOT NULL,
    orderpriority VARCHAR(255) NOT NULL,
    orderdate VARCHAR(255) NOT NULL,
    orderid INT,
    shipdate VARCHAR(255) NOT NULL,
    unitssold INT NOT NULL,
    unitprice FLOAT NOT NULL,
    unitcost FLOAT NOT NULL,
    totalrevenue FLOAT NOT NULL,
    totalcost FLOAT NOT NULL,
    totalprofit FLOAT NOT NULL,
    PRIMARY KEY (orderid)
);

LOAD DATA INFILE "/tmp/records/sample.csv" 
INTO TABLE sales_records 
COLUMNS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

LOAD DATA INFILE "/tmp/records/sales_records.csv" 
INTO TABLE sales_records 
COLUMNS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;



region, country, itemtype, saleschannel, orderpriority, orderdate, orderid, shipdate, unitssold, unitprice, unitcost, totalrevenue, totalcost, totalprofit