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
%
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

| awk variable name | what it stands for |
|:-----------------:|:------------------:|
| FILENAME          | Name of current input file|
| RS                | Input record separator (Default is new line)|
| OFS               | Output field separator string (Blank is default)|
| ORS               | Output record separator string (Default is new line)|
| NF                | Number of fields in input record |
| NR                | Number of input record |
| OFMT              | Output format of number |
| FS                | Field separator character (Blank & tab is default)





































