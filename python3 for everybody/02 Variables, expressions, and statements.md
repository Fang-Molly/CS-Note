Chapter 2  Variables, expressions, and statements
-----------

# 2.1 Values and types

* **value**
   * one of the basic things a program works with, like a letter or a number
   
* **types**
   + **integer**
      * type **int**
      * 2
   + **floating point**
      * type **float**
      * 3.2
   + **string**: 
      * type **str**
      * enclosed in quotation marks, " double-quotes or ' single-quotes
      * "Hello, World!"; "17"; "3.2"
   
```
# print() for integers/float
>>> print(4)
4
>>> print(3.2)
3.2
   
# print() for strings
>>> print("Hello, World!")
Hello, World!
```

* **type()** can tell you what type a value has

```
>>> type(17)
<class 'int'>
>>> type(3.2) 
<class 'float'>
>>> type('Hello, World!') 
<class 'str'>
>>> type('17') 
<class 'str'> 
>>> type('3.2') 
<class 'str'>
```

* **int()** function can convert value to integer

```
>>> int(3.9)
3
```

* **round()** function can round value
   
```
>>> round(3.9)
4
```

* **float()** function can convert value to float

```
>>> float(9)
9.9
```
   
* **str()** function can convert value to string

```
>>> print('the number is : ' + str(3))
the number is : 3
```

# 2.2 Variables

+ **variale** : a name refers to a value

+ **assignment statement** : create new variables and give them values
   * **operator**: **=**

```
# assign a string to a new variable named message
>>> message = 'And now for something completely different' 

# assign the integer 17 to n
>>> n = 17

# assign the approximate value of π to pi
>>> pi = 3.1415926535897931

# display the value of a variable with a print statement
>>> print(n)
17
>>> print(pi) 
3.141592653589793

>>> type(message) 
<class 'str'>
>>> type(n) 
<class 'int'>
>>> type(pi) 
<class 'float'>
```

# 2.3 Variable names and keywords

+ **variable names**
   + can contain both letters and numbers
   + can't start with a number
   + case sensitive, can contain a uppercase letters, but better to begin with a lowercase letter 
   + can contain the underscore character ( _ ) 
   + avoid starting with an underscore character unless we are writing library code for others to use
   + can't use Python keywords
   + case sensitive
   + popular variable names include i ,x and j.
   
+ **Python reserves 35 keywords**
   + and as assert break class continue def 
   + del elif else except False finally for 
   + from global if import in is lambda 
   + None nonlocal not or pass raise return
   + True try while with yield async await
   
# 2.4 Statements

+ **statement**: a unit of code that the Python interpreter can execute
   * expression statement : print()
   * assignment: produce no output

# 2.5 Operators and operands

+ **operators**
   * special symbols represent computations
   * computations : + addition, - subtraction, * multiplication, / division and ** exponentiation
   * You should add space around operators like x = 100 so that it’s easier to read.
+ **operands** 
   * the values the operator is applied to

```
# the division result is a floating point
>>> division = 7 / 3
>>> print(division)
2.3333333333333335

# floored (// integer) division
>>> quotient = 7 // 3
>>> print(quotient)
2

#
>>> remainder = 7 % 3
>>> print(remainder)
1
```

# 2.6 Expressions

+ **expression** : a combination of values, variables, and operators

```
>>> x = 5
>>> x + 1
6
```
   
# 2.7 Order of operations

+ **rules of precedence** : (PEMDAS) parentheses, exponents, multiplication, division, addtion, subtraction
   + **Parentheses** have the highest precedence
   + **Exponentiation** has the next highest precedence
   + **Multiplication** and **Division** have the same precedence, higher than **Addition** and **Subtraction**
   + Operators with the same precedence are evaluated from left to right
   
# 2.8 Modulus operator

+ **modulus operator** : 
   + works on **integers** and yields the **remainder** when the first operand is divided by the second.
   + a percent sign (%) 
   
```
# the division result is a floating point
>>> division = 7 / 3
>>> print(division)
2.3333333333333335

# floored (// integer) division
>>> quotient = 7 // 3
>>> print(quotient)
2

#
>>> remainder = 7 % 3
>>> print(remainder)
1

# So 7 divided by 3 is 2 with 1 left over.
```
+ check whether one number is divisible by another
   + if x % y is zero, then x is divisible by y
+ extract the right-most digit or digits from a number
   + x % 10 yields the right-most digit of x (in base 10)
   + x % 100 yields the last two digits
   
# 2.9 String operations

+ The ** + operator** performs **concatenation**, join the strings by linking them end to end

```
>>> first = 10
>>> second = 15
>>> print(first+second) 
25
>>> first = '100'
>>> second = '150'
>>> print(first + second) 
100150
```

+ the ** * operator** multiplies the content of a string by an integer

```
>>> first = 'Test'
>>> second = 3
>>> print(first * second)
Test Test Test
```

# 2.10 Asking the user for input

* input() : built-in function
   * take the value for a variable from the user
   * the type of user typed is a **string**

```
>>> inp = input() 
Some silly stuff 
>>> print(inp) 
Some silly stuff
>>> type(inp)
<class 'str'>
```
* print a prompt telling the user what to input

```
>>> name = input('What is your name?\n') 
What is your name?
Chuck
>>> print(name)
Chuck
```
* **sequence \n** at the end of the prompt represents a **newline**, which is a special character that causes a line break.

```
>>> name = input('What is your name?')
What is your name?Chuck
>>> print(name)
Chuck
```
```
>>> prompt = 'What...is the airspeed velocity of an unladen swallow?\n' 
>>> speed = input(prompt)
What...is the airspeed velocity of an unladen swallow?
17
>>> int(speed)
17
>>> int(speed) + 5
22
```

# 2.11 Comments

* add notes to your programs to explain in natural language what the program is doing
* start with the **# symbol**
* can put comments on a line by itself
* can put comments at the end of a line
* it has no effect on the program

# 2.12 Choosing mnemonic variable names


# 2.13 Debugging

* illegal variable name

# 2.14 Glossary

* assignment 
   * A statement that assigns a value to a variable.
   
* concatenate 
   * To join two operands end to end.
   
* comment 
   * Information in a program that is meant for other programmers (or anyone reading the source code) and has no effect on the execution of the program.
   
* evaluate 
   * To simplify an expression by performing the operations in order to yield a single value.
   
* expression 
   * A combination of variables, operators, and values that represents a single result value.
   
* floating point
   * A type that represents numbers with fractional parts.
   
* integer 
   * A type that represents whole numbers.
   
* keyword 
   * A reserved word that is used by the compiler to parse a program; you cannot use keywords like if, def, and while as variable names. 
   
* mnemonic
   * A memory aid. We often give variables mnemonic names to help us remember what is stored in the variable.
   
* modulus operator 
   * An operator, denoted with a percent sign (%), that works on integers and yields the remainder when one number is divided by another. operand One of the values on which an operator operates.
   
* operator 
   * A special symbol that represents a simple computation like addition, multiplication, or string concatenation.

* rules of precedence 
   * The set of rules governing the order in which expressions involving multiple operators and operands are evaluated.

* statement 
   * A section of code that represents a command or action. So far, the statements we have seen are assignments and print expression statement.

* string 
   * A type that represents sequences of characters.

* type 
   * A category of values. The types we have seen so far are integers (type int), floating-point numbers (type float), and strings (type str).
   
* value 
   * One of the basic units of data, like a number or string, that a program manipulates.

* variable 
   * A name that refers to a value.

-------------

# 2.15 Exercises

**Exercise 1: Type the following statements in the Python interpreter to see what they do:**

5  
x=5  
x+1

**Answer:**

```python
>>> 5
5
>>> x = 5
>>> x + 1
6
```

**Exercise 2: Write a program that uses input to prompt a user for their name and then welcomes them.**  

```python
Enter your name: Chuck  
Hello Chuck  
```
**Answer:**  

```python
name = input('Enter your name: ')
print('Hello',name)
```

**Exercise 3: Write a program to prompt the user for hours and rate per hour to compute gross pay.**  

```
Enter Hours: 35  
Enter Rate: 2.75  
Pay: 96.25  
```

We won’t worry about making sure our pay has exactly two digits after the decimal place for now. If you want, you can play with the built-in Python round function to properly round the resulting pay to two decimal places.

**Answer:**

```python
hour = input('Enter Hours: ')
rate = input('Enter Rates: ')
pay = float(hour) * float(rate)
print('Pay:',pay)
```


**Exercise 4: Assume that we execute the following assignment statements:**

width = 17  
height = 12.0  

For each of the following expressions, write the value of the expression and the type (of the value of the expression).  

1. width//2  
2. width/2.0  
3. height/3  
4. 1 + 2 * 5

Use the Python interpreter to check your answers.

**Answer:**
1. 8;  2. 8.5;  3. 4.0;  4. 11

**Exercise 5: Write a program which prompts the user for a Celsius temperature, convert the temperature to Fahrenheit, and print out the converted temperature.**

**Answer: **  

```python
cel = input('Enter the Celsius temperature: ')
fah = float(cel) * 1.8 + 32
print('The Fahrenheit temperature: ',fah)
```
