# 1. Awk

## 1.1 record and field

* In awk we refer to each line in the file as a record, and each column as a field.

* In awk we access fields using syntax like: $1 or $2.

```
# File: example.txt
1 shear 5 20.00
2 compressional 10 2.00
3 anisotropy 30 3.50
4 perovskite 2 45.50
5 olivine 25 33.19 
```

* Printing fields

```
% awk '{print $2}' example.txt
shear
compressional
anisotropy
perovskite
olivine
%
% awk '{print $1, $4}' example.txt
1 20.00
2 2.00
3 3.50
4 45.50
5 33.19
%
% awk '{print $4, $2}' example.txt
20.00 shear
2.00 compressional
3.50 anisotropy
45.50 perovskite
33.19 olivine
% 
% awk '{print $1$2}' example.txt
1shear
2compressional
3anisotropy
4perovskite
5olivine
%
% awk '{print $0}' example.txt
1 shear 5 20.00
2 compressional 10 2.00
3 anisotropy 30 3.50
4 perovskite 2 45.50
5 olivine 25 33.19 
%
% awk '{print $1$2"-->$"$4}' example.txt
1shear-->$20.00
2compressional-->$2.00
3anisotropy-->$3.50
4perovskite-->$45.50
5olivine-->$33.19
```

* Simple arithmetic on fields

```
% awk '{print($1*$3)}' example.txt
5
20
90
8
125
%
% awk '{print($4-$3),($1+$1)}' example.txt
15 2
-8 4
-26.5 6
43.5 8
8.19 10
%
% awk '{print($3/$1), $2, (2*3.14*$1)}' example.txt
5 shear 6.28
5 compressional 12.56
10 anisotropy 18.84
0.5 perovskite 25.12
5 olivine 31.4
%
% awk '{print int($4)}' example.txt
20
2
3
45
33
```

## 1.2 awk Variables

| awk variable name | what it stands for                                  |
|:-----------------:|:---------------------------------------------------:|
| FILENAME          | Name of current input file                          |
| RS                | Input record separator (Default is new line)        |
| OFS               | Output field separator string (Blank is default)    |
| ORS               | Output record separator string (Default is new line)|
| NF                | Number of fields in input record                    |
| NR                | Number of input record                              |
| OFMT              | Output format of number                             |
| FS                | Field separator character (Blank & tab is default)  |


* Simple sorting routines

```
% awk 'NR > 3 {print $0}' example.txt
4 perovskite 2 45.50
5 olivine 25 33.19 
%
% awk 'NR <= 3 {print $2}' example.txt
shear
compressional
anisotropy
%
% awk '$3 >= 10 {print $0}' example.txt
2 compressional 10 2.00
3 anisotropy 30 3.50
5 olivine 25 33.19
%
% awk '$2 ~ /perov/ {print $0}' example.txt
4 perovskite 2 45.50
%
% awk '$2 !~ /perov/ {print $0}' example.txt
1 shear 5 20.00
2 compressional 10 2.00
3 anisotropy 30 3.50
5 olivine 25 33.19
```

* Comparison operators

| comparison operators | what it stands for            |
|:--------------------:|:-----------------------------:|
| <                    | Less than                     |
| <=                   | Less than or equal            |
| ==                   | Equal                         |
| !=                   | Not equal                     |
| >=                   | Greater than or equal         |
| >                    | Greater than                  |
| ~                    | Contains (for strings)        |
| !~                   | Does not contain (strings)    |


* Logic operators

    * `&&` is the AND operator
    * `||` is the OR operator

* Sorting with logic

```
% awk 'NR > 2 && NR < 5 {print $0}' example.txt
3 anisotropy 30 3.50
4 perovskite 2 45.50
%
% awk '$3 > 10 && $4 > 2.5 {print $0}' example.txt
3 anisotropy 30 3.50
5 olivine 25 33.19
%
% awk '$2 ~ /aniso/ || $2 ~ /oliv/ {print $0}' example.txt
3 anisotropy 30 3.50
5 olivine 25 33.19
%
% awk 'NR >= 2 && $2 ~ /aniso/ || $2 ~ /oliv/ {print $0}' example.txt
3 anisotropy 30 3.50
5 olivine 25 33.19
```

* `BEGIN` OR `END`

```
% awk 'END {print $0}' example.txt
5 olivine 25 33.19
%
% awk 'END {print NR}' example.txt
5
%
% awk 'END {print NF}' example.txt
4
%
% awk 'BEGIN {print NF}' example.txt
0
%
% awk 'BEGIN {OFS = "_"} {print $1, $2}' example.txt
1_shear
2_compressional
3_anisotropy
4_perovskite
5_olivine
%
% awk 'BEGIN { FS = "o"} {print $1, $2}' example.txt
1 shear 5 20.00 
2 c mpressi
3 anis tr
4 per vskite 2 45.50
5  livine 25 33.19
%
% awk 'BEGIN {print "Example #5"} {print $2} END {print "End of Example"}' example.txt
Example #5
shear
compressional
anisotropy
perovskite
olivine
End of Example
```

* 

























