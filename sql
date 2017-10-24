offset o or 1 rows
fetch next 10 rows only
also check majorshare holder tab more link for daily changes
primary key foreign key and composite key
************************************************************************************************
CREATE TABLE voting (
  QuestionID NUMERIC,
  MemberID NUMERIC,
  PRIMARY KEY (QuestionID, MemberID)
);
The pair (QuestionID,MemberID) must then be unique for the table and neither value can be NULL. If you do a query like this:

SELECT * FROM voting WHERE QuestionID = 7
it will use the primary key's index. If however you do this:

SELECT * FROM voting WHERE MemberID = 7
it won't because to use a composite index requires using all the keys from the "left". If an index is on fields (A,B,C) and your criteria is on B and C then that index is of no use to you for that query. So choose from (QuestionID,MemberID) and (MemberID,QuestionID) whichever is most appropriate for how you will use the table.

If necessary, add an index on the other:

CREATE UNIQUE INDEX idx1 ON voting (MemberID, QuestionID);

*****************************************************************************************************
sql server has more then 8 type of indexes 
A heap is a table without a clustered index.
SQL language is divided into four types of primary language statements: DML, DDL, DCL and TCL.
*************************************************************************************************************
DML (Data Manipulation Language)

DML statements affect records in a table. These are basic operations we perform on data such as selecting a few records from a table, inserting new records, deleting unnecessary records, and updating/modifying existing records.

DML statements include the following:

SELECT – select records from a table
INSERT – insert new records
UPDATE – update/Modify existing records
DELETE – delete existing records

DDL (Data Definition Language)

DDL statements are used to alter/modify a database or table structure and schema. These statements handle the design and storage of database objects.

CREATE – create a new Table, database, schema
ALTER – alter existing table, column description
DROP – delete existing objects from database

DCL (Data Control Language)

DCL statements control the level of access that users have on database objects.

GRANT – allows users to read/write on certain database objects
REVOKE – keeps users from read/write permission on database objects

TCL (Transaction Control Language)

TCL statements allow you to control and manage transactions to maintain the integrity of data within SQL statements.

BEGIN Transaction – opens a transaction
COMMIT Transaction – commits a transaction
ROLLBACK Transaction – ROLLBACK a transaction in case of any error
***********************************************************************************************************************************
http://www.tech-recipes.com/rx/category/database/

Every table needs a clustered index and a primary key. By default, the PK is clustered but it can be non-clustered if you want like you're done.

You have specified a non-clustered PK so the profiler suggests a clustered index...

Note: a table without a clustered index is called a "heap" because it's a pile of unstructured data..
https://stackoverflow.com/users/73226/martin-smith?tab=answers
SQL Server Query Performance Tuning
byGrant Fritchey
