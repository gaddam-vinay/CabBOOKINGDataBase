import subprocess as sp
import pymysql
import pymysql.cursors


def option2():
    """
    Function to implement option 1
    """
    print("Not implemented")


def option3():
    """
    Function to implement option 2
    """
    print("Not implemented")


def option4():
    """
    Function to implement option 3
    """
    print("Not implemented")


def insertInAccount():
    ID = -1
    try:
       
        # Takes emplyee details as input
        row = {}
        print("Enter new Account details: ")
        name = (input("Name (Fname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Lname"] = name[1]
        row["UserName"] = input("UserName: ")
        row["Password"] = input("Password")
        row["Password_hint"] = input("Password Hint:")
        row["EMAIL"] = input("EMAIL: ")
        row["Address"] = input("Address: ")
        if(len(row["Password"])<8):
            print("password length must be atleast 8")
            return -1
        
        query = "INSERT INTO Account(firstname, lastname, username, Email, Password, Password_hint) VALUES('%s', '%s', '%s', '%s', '%s', '%s')" % (
            row["Fname"], row["Lname"], row["UserName"], row["EMAIL"], row["Password"], row["Password_hint"])

        #print(query)
        cur.execute(query)
        con.commit()

        #print("Inserted Into Database")
        query = "SELECT LAST_INSERT_ID()"
        cur.execute(query)
        rows = cur.fetchall()
        ID = int(rows[0]['LAST_INSERT_ID()'])
    except Exception as e:
        con.rollback()
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>")

    
    return ID

def insertInCustomer(id):
    try:
        row = {}

        row["Home_Address"] = input("Home_Address: ")
        row["Work_Address"] = input("Work_Address:")
        
        
        query = "INSERT INTO Customer(Customer_Id,Home_Address, Work_Address) VALUES('%d','%s', '%s')" % ( id,row["Home_Address"], row["Work_Address"])

        #print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")
    
    except Exception as e:
        con.rollback()
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def InsertInRide(customer_id):
    try:
        row = {}

        row["Pickup_location"] = input("Pickup_location: ")
        row["Destination"] = input("Destination:")
        row["Distance"] = input("Distance: ")
        row["Shared"] = input("Shared:")
        
        query = "INSERT INTO Ride(Customer_Id,Pickup_location, Destination,Distance,Shared) VALUES('%d','%s', '%s','%s','%s')" % (customer_id,row["Pickup_location"], row["Destination"],row["Distance"],row["Shared"])

        #print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()

        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)



#drivers
def changeridestate():
   try:
       k = (input("(rideno state): ")).split(' ')
       query = "UPDATE Ride SET status = '%s' WHERE Ride_number= '%s';"%(
           k[1], k[0])
       print(query)
       cur.execute(query)
       con.commit()
       print("inserted into database")
   except Exception as e:
       con.rollback()
       print("Failed to insert into database")
       print(">>>>>>>>>>>>>", e)
def changedriverpassword(driver_ID):
   try:
    
       t = input("newpassword: ")
       query = "UPDATE Account SET password='%s' WHERE id='%d'"%(t, driver_ID)
       print(query)
       cur.execute(query)
       con.commit()
       print("inserted into database")
   except Exception as e:
       con.rollback
       print("Failed to insert into database")
       print(">>>>>>>>>>>>",e)
def updatedriverphnno(driver_ID):
   try:
       t = input("newphone no: ")
       if len(t) < 10:
           print("phone_number < 10")
           return
       query = "UPDATE Contact SET Contact_number='%s' WHERE id_account=%d"%(t, driver_ID)
       print(query)
       cur.execute(query)
       con.commit()
       print("UPDATED  database")
   except Exception as e:
       con.rollback()
       print("Failed to insert into database")
       print(">>>>>>>>>>>>",e)
 
def Get_Driver_Rating(Driver_ID):
    try:
       query = "SELECT Driver_ID, AVG(Feedback.Rating) FROM( SELECT Vehicle.Driver_Id  as Driver_ID , Ride.Ride_number as x FROM Vehicle JOIN Ride ON Ride.Vehicle_Id = Vehicle.Vehicle_Id )As t JOIN Feedback ON Feedback.Ride_number = x WHERE Driver_Id = '%d' GROUP BY Vehicle.Driver_Id;" %(Driver_ID)
       print(query)
       cur.execute(query)
       con.commit()
       #print("inserted into database")

       rows = cur.fetchall()
       print()
       for row in rows:
           print(row)
    except Exception as e:
       con.rollback()
       print("Failed to insert into database")
       print(">>>>>>>>>>>>",e)
# Administrtors
def Report_renew():
    
    try:
        
        print("Message to the Drivers whose License is about to get expired within 30 days")
        rows={}
        query = "SELECT Account.firstName, Account.lastname FROM Driver JOIN Account ON Account.Id=Driver.Driver_Id WHERE Valid_Till<=curdate()+interval 30 day" 
        print()
        print(query)
        cur.execute(query)
        rows = cur.fetchall()
        print("FirstName  Lastname")
        for i in rows:
          print(i['firstName'],i['lastname'])
        print()
        con.commit()

        print("Successful")

    except Exception as e:
        con.rollback()
        print("Failed")
        print(">>>>>>>>>>>>>", e)

    return


def Vehicles_analysis():

    try:
        
        print("Analysis of Number of vehicles in service of different Model_types")
        rows={}
        query = "SELECT COUNT(Vehicle.Vehicle_Id) as number_of_vehicles, Vehicle.Vehiclemodel_Id,Vehicle_model.Model_type FROM Vehicle JOIN Vehicle_model ON Vehicle_model.Vehiclemodel_Id = Vehicle.Vehiclemodel_Id WHERE In_Service = TRUE GROUP BY Vehicle.Vehiclemodel_Id ORDER BY COUNT(Vehicle_Id) DESC" 
        
        print()
        print(query)
        cur.execute(query)
        rows = cur.fetchall()
        print("number_of_vehicles   Vehiclemodel_Id   Model_type ")
        for i in rows:
          print(i['number_of_vehicles'],i['Vehiclemodel_Id'],i['Model_type'])
        print()  
        con.commit()

        print("Successful")

    except Exception as e:
        con.rollback()
        print("Failed")
        print(">>>>>>>>>>>>>", e)

    return
    


def Remove_not_in_service_vehicles():
    
    try:
        # Takes emplyee details as input
        
        var=0
        """
        query = "INSERT INTO Driver(Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) VALUES('%d', '%s', '%d', '%s', '%s', '%s')" % (
            row["Driver_Id"], row["Dateofbirth"], row["Licensenumber"], row["Dateofjoining"], row["DateofIssue"], row["Valid_Till"])
        """
        query = "DELETE FROM Vehicle WHERE Driver_Id='%d'" % (var)
        
        print(query)
        cur.execute(query)
        con.commit()

        print("Successful")

    except Exception as e:
        con.rollback()
        print("Failed")
        print(">>>>>>>>>>>>>", e)

    return


def Add_vehicles():
    try:
        row = {}
        print("Enter new drivers details: ")

        row["Vehiclemodel_Id"]=int(input("Vehicle_model_Id  : "))
        row["Driver_Id"]=int(input("Driver id :"))
        row["In_Service"]=input("In_Service: ")
        row["Vehicle_registration_plate"]= input("Vehicle_registration_plate :")
        
        query = "INSERT INTO Vehicle(Vehiclemodel_Id, Driver_Id, In_Service, Vehicle_registration_plate) VALUES('%d', '%d', '%d', '%s')" % (
            row["Vehiclemodel_Id"], row["Driver_Id"], row["In_Service"], row["Vehicle_registration_plate"])
        
        print(query)
        cur.execute(query)
        con.commit()

        print("Successful")

    except Exception as e:
        con.rollback()
        print("Failed")
        print(">>>>>>>>>>>>>", e)

    return


def Hire_a_driver():
    
    try:
        Driver_ID = insertInAccount();
        # Takes emplyee details as input
        row = {}
        print("Enter new drivers details: ")
        row["Dateofbirth"] = input("Dateofbirth (YYYY-MM-DD): ")
        row["Licensenumber"] = int(input("Licensenumber : "))
        row["Dateofjoining"] = input("Dateofjoining (YYYY-MM-DD): ")
        row["DateofIssue"] = input("DateofIssue (YYYY-MM-DD): ")
        row["Valid_Till"] = input("Valid_Till (YYYY-MM-DD): ")
        

        query = "INSERT INTO Driver(Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) VALUES('%d', '%s', '%d', '%s', '%s', '%s')" % (
            Driver_ID, row["Dateofbirth"], row["Licensenumber"], row["Dateofjoining"], row["DateofIssue"], row["Valid_Till"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def AdministratorFunctions(ch):

    if(ch == 1):
        Hire_a_driver()
    elif(ch == 2):
        Remove_not_in_service_vehicles()
    elif(ch == 3):
        Report_renew()
    elif(ch == 4):
        Vehicles_analysis() 
    elif(ch ==5):
        Get_Driver_Rating()                
    else:
        print("Error: Invalid Option")


def DriverFunctions(ch,Driver_ID):

    if(ch == 1):
       changeridestate()
    elif(ch == 2):
       changedriverpassword(Driver_ID)
    elif(ch == 3):
       updatedriverphnno(Driver_ID)
    elif(ch == 4):
       Get_Driver_Rating(Driver_ID)
    else:
       print("Error: Invalid Option")

def customerFunctions(ch,customer_id):
    if(ch == 1):
        InsertInRide(customer_id)
    else:
        print("Error: Invalid Option")

def customerSignin_login(ch):
    if(ch == 1):
        id = insertInAccount()
        if(id!=-1):
            insertInCustomer(id)
        
    elif(ch == 2):
        username = input("Username: ")
        password = input("Password: ")
        try:
            query = "SELECT Id from Account WHERE username = '%s' and  Password = '%s';"%(username,password);
            # gets the number of rows affected by the command executed 
            print(query)
            cur.execute(query) 
            con.commit()
            row_count =cur.rowcount
            if row_count ==0 : print ("Wrong password or UserName")
            else:
                rows = cur.fetchall()
                customer_id = rows[0]["Id"]
                while(1):
                    tmp = sp.call('clear', shell=True)
                    
                    print("1. Add ride")  
                    print("2. Logout")
                    ch = int(input("Enter choice> "))
                    tmp = sp.call('clear', shell=True)
                    if ch == 2:
                        return
                    else:
                        customerFunctions(ch, customer_id)
                        tmp = input("Enter any key to CONTINUE>")
        except Exception as e:
            con.rollback()
            print("Failed SELECT")
            print(">>>>>>>>>>>>>", e)
    else:
        print("Error: Invalid Option")

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        if(("abc" == input("Username: ")) and ("1234" == input("Password: "))):
            while(1):
                tmp = sp.call('clear', shell=True)
                
                print("1. Hire_a_driver")  # Hire an Employee
                print("2. Remove_not_in_service_vehicles")  # Promote Employee
                print("3. Report_renew")
                print("4. Vehicles_analysis")
                print("5. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    return
                else:
                    AdministratorFunctions(ch)
                    tmp = input("Enter any key to CONTINUE>")


    elif(ch == 2):
        username = input("Username: ")
        password = input("Password: ")
        try:
            query = "SELECT Id from Account WHERE username = '%s' and  Password = '%s';"%(username,password);
            # gets the number of rows affected by the command executed 
            print(query)
            cur.execute(query)
            con.commit()
            row_count = cur.rowcount
            if row_count ==0 : print ("Wrong password or UserName")
            else:
                rows = cur.fetchall()
                Driver_id = rows[0]["Id"]
                while(1):
                    tmp = sp.call('clear', shell=True)
                    
                    print("1. changer id state")  
                    print("2. change driver password")
                    print("3. update driver phnno")  
                    print("4. Get Driver Rating")  
                    ch = int(input("Enter choice> "))
                    tmp = sp.call('clear', shell=True)
                    if ch == 7:
                        exit()
                    else:
                        DriverFunctions(ch ,Driver_id )
                        tmp = input("Enter any key to CONTINUE>")
        except Exception as e:
            con.rollback()
            print("Failed SELECT")
            print(">>>>>>>>>>>>>", e)

        
    elif(ch == 3):
        while(1):
            tmp = sp.call('clear', shell=True)
            print("Customer") 
            print("1.signIn")  
            print("2. login")
            print("3. Logout")
            ch = int(input("Enter choice> "))
            tmp = sp.call('clear', shell=True)
            if ch == 3:
                exit()
            else:
                customerSignin_login(ch)
                tmp = input("Enter any key to CONTINUE>")
    elif(ch == 4):
        option4()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="root",
                              password="1234",
                              db='CABSERVICE',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                
                print("1. login as Administer")  
                print("2. login as Driver")
                print("3. sign/login as a Customer")  
                print("5. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
