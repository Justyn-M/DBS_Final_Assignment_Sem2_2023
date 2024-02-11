# PyConnect.py - Connect to MySQL database using Python
# To attempt to connect to database, run python3 PyConnect.py in terminal

# I could not connect to mysql using python on my laptop running a linux virtual machine using WSL for a reason I have no idea about.
# I have attempted to debug the issue and attempted solutions but to no avail

# The code below is what I would have used to connect to the database if I could

import mysql.connector

# Change credentials to match your own credentials
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="pswrd1",
    database="Nobel_Prize_Laureates_21029112"
)

# Cursor
cursor = conn.cursor()

# Simple select query that shows everything in winner table
select_query = "SELECT * FROM Winner"
cursor.execute(select_query)

# Get all data from the result of the query
rows = cursor.fetchall()

# Insert query using python for a new winner
insert_ = "INSERT INTO Winner (First_Name, Last_Name, DOB, DOD, Gender, Country) VALUES (%s, %s, %s, %s, %s, %s)"
cursor.execute(insert_, ('John', 'Clauser', '1942-12-01', 'NULL', 'Male', 'Australia'))
print("Data Successfully Inserted")

# Update query using python for the new winner
update_ = "UPDATE Winner SET Country = %s WHERE First_Name = %s, Last_Name = %s"
cursor.execute(update_, ('USA', 'John', 'Clauser'))
print("Updated Winner's Data")

# Delete the new winner
delete_ = "DELETE FROM Winner WHERE First_Name = %s, Last_Name = %s"
cursor.execute(delete_, ('John', 'Clauser'))
print("Person Deleted!")

# Commit changes to my database
conn.commit()

# Close cursor and connection to mysql database
cursor.close()
conn.close()