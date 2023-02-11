functions and their  de escription:

admin functions:

1. hire a driver:
add one row or tuple to driver table with attribute taken as input from user
2. remove not in service vechiles:
removes all the vechiles which are not in service from vechile table on failure prints failed and error exception number
3. reportrenew:
output all the names of the drivers whose license is about to expire whith in 30 days if succesful on failure it prints failed and error number
4. vechile analysis:
prints the number of different types of vechiles with model type vechile model id on failue prints failed and error number


driver functions:

1. changeridestate:
updates the state attiribute of row of ride table with given raid number if valid to given state
2. changedriverpassword:
updates the password of the row of account table with given id 
3. updatedriverphnno:
changes the phone number of row with id which is taken as input of account table to given password
4. get driver rating:
prints average rating of driver form feedback table its an aggregate function 

user functions:

1. signin
creates an account i,e adds a tuple to account table and customer table by taking attributes as input
2. login
if there already exists an account login to it
3. addride
adds a new tuple to ride table