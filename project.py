while(True):
    print("selct an option :")
    print("1. generate a pattern")
    print("2. analyze a range of number")
    print("3. exit")
    user_input = int(input("Enter your choice :"))

    if user_input == 3:
        break

    if user_input == 2:
        starting_range = int(input("Enter the start of the range :"))
        ending_range = int(input("Enter the end of the range :"))
        sum = 0
        for num in range(starting_range , ending_range + 1):
            sum = sum + num
            if num % 2 :
                print(f"Number {num} is odd")
            else:
                print(f"Number {num} is even")
        
        else:
            print(f"Sum of all numbers from {starting_range} to {ending_range} is :{sum}")
    
    if user_input == 1:
        n = int(input("Enter the number of rows for the pattern :"))
        for row in range(0, n):
            for cal in range(0, row+1):
                print("* ", end="")
            print()