# fruits = ["Apple", "Banana", "Orange", "Grapes"]
# print("Second fruit:", fruits[1])
# print("Last fruit:", fruits[-1])

# fruits.append("Mango")
# print(fruits)

# fruits.pop(0)

# fruits.sort()
# print("Sorted list:", fruits)

# fruits.reverse()
# print("Reversed list:", fruits)

print("****************************")

# numbers = (10, 20, 30, 40, 50)
# print("Third number in the tuple:", numbers[2])

# not chnage value in the tuple

print("****************************")

# list = [5, 15, 55]
# tuple = (5, 15, 55)
# list[0] = 10
# print(list)
#tuple ma change na thay sake a inmutable che 

print("****************************")

squares = [x**2 for x in range(1, 11)]
print("Squares from 1 to 10:", squares)

even_numbers = [x for x in range(1, 21) if x % 2 == 0]
print("Even numbers from 1 to 20:", even_numbers)

words = ["hello", "WORLD", "PyThOn"]
lowercase_words = [word.lower() for word in words]
print("Lowercase words:", lowercase_words)



