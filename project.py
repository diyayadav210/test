students = {}  

print(" Welcome to the Student Data Organizer ")

while True:

    print("1. Add Student")
    print("2. Display All Students")
    print("3. Update Student")
    print("4. Delete Student")
    print("5. Show All Subjects")
    print("6. Exit")

    choice = input("Enter choice (1-6): ")

    if choice == "1":   
        sid = input("Enter Student ID: ")
        name = input("Enter Name: ")
        age = int(input("Enter Age: "))   
        grade = input("Enter Grade: ")
        dob = input("Enter Date of Birth (DD-MM-YYYY): ")
        subjects = input("Enter Subjects (comma separated): ").split(",")

        unique_info = (sid, dob)

        students[sid] = {
            "Name": name,
            "Age": age,
            "Grade": grade,
            "Subjects": list(set([s.strip().title() for s in subjects])), 
            "UniqueInfo": unique_info
        }
        print(f"{name} added successfully!")

    elif choice == "2":   
        if not students:
            print("No students yet.")
        else:
            for sid, info in students.items():
                print("\n----------------------")
      
                print(f"ID: {sid}, Name: {info['Name']}, Age: {info['Age']}, Grade: {info['Grade']}")
                print("Subjects: {}".format(", ".join(info["Subjects"])))
                print("DOB: %s" % (info["UniqueInfo"][1]))

    elif choice == "3":   
        sid = input("Enter Student ID to Update: ")
        if sid in students:
            new_age = int(input("Enter New Age: "))
            students[sid]["Age"] = new_age   
            print("Age updated!")
        else:
            print("Student not found!")

    elif choice == "4": 
        sid = input("Enter Student ID to Delete: ")
        if sid in students:
            del students[sid]  
            print("Student deleted!")
        else:
            print("Student not found!")

    elif choice == "5":  
        all_subjects = set()   
        for info in students.values():
            all_subjects.update(info["Subjects"])
        print("Subjects Offered:", ", ".join(all_subjects) if all_subjects else "None")

    elif choice == "6":   
        print("Thank you for using Student Data Organizer!")
        break

    else:
        print("Invalid choice, try again.")
