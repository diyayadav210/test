print("Welcome to the student Data Organizer !")
while(True):
    print("Select an option :")
    print("1. Add Student")
    print("2. Display All Student")
    print("3. Update Student Information")
    print("4. Delete Student")
    print("5. Display Subject Offered")
    print("6. Exit")
    user_input = int(input("Enter your choice :"))
    
    if user_input == 1:
        print("Enter Students Details :")
        Student_id =int(input("Student Id:"))
        name = input("Name :") 
        age = int(input("Age :"))
        grade = input("Grade :")
        dob = input("YYYY-MM-DD :")
        sub = input("Subject (comma-separated) :")

    
    print("Student added successfully !")

    

