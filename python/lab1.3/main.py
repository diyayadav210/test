user_input = input("Enter a value :")
int_v = int(user_input)
float_v = float(user_input)
str_v = str(user_input)
bool_v = bool(user_input)

print(int_v,type(int_v))
print(float_v,type(float_v))
print(str_v,type(str_v))
print(bool_v,type(bool_v))

print("************************************")

number = float(input("Enter a value :"))
number_int = int(number)
print("Original floating-point number:", number)
print("After converting to integer:", number_int)

print("************************************")

bool_value = bool(input("Enter boolean value(True / False) :"))
int_value = int(bool_value)
str_value = str(bool_value)
print("original value :" , bool_value)
print("Integer value :" , int_value)
print("String value :" , str_value)

print("************************************")

int = 23
float = 2.3
string = "yadav diya"
boolean = True
list = [1, 3, "diya", 2.4]
tuple = (1, 2, 3, 4, 5)
dictionary = {
    "name" : "diya",
    "marks" : 86
} 
print(int ,type(int),id(int))
print(float ,type(float),id(float))
print(string ,type(string),id(string))
print(boolean ,type(boolean),id(boolean))
print(list ,type(list),id(list))
print(tuple ,type(tuple),id(tuple))
print(dictionary ,type(dictionary),id(dictionary))

print("************************************")

a = "diya"
b = "diya"
print(id(a))
print(id(b))

