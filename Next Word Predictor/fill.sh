#! /bin/bash

python3 create_fst.py 

<<com 
# python script file create_fst.py
y = input("")
X = y.split()

vocab = open("symbol_vocab.txt", "r")
lines = vocab.readlines()

l = []
for line in lines:
    l.append(line.split('\t'))
    
file1 = open("F.txt","w")
token = 0
for i in range(len(X)):
    if X[i] == 'XXX':
        for j in range(len(l)):
            file1.write(l[j][-1][0:len(l[j][-1])-1] +' '+ 'XXX ' + l[j][0] + '\n')
    else:
        for k in range(len(l)):
            if l[k][0] == X[i]:
                token = k;
        file1.write(l[token][-1][0:len(l[token][-1])-1] +' '+ X[i] +' '+ X[i]+ '\n')
        
file1.close() 

com
/mnt/c/Users/PUKHRAJ/Desktop/my_project/CS_753/kaldi/tools/openfst-1.7.2/bin/fstcompile --osymbols=symbol_vocab.txt F.txt F.fst

/mnt/c/Users/PUKHRAJ/Desktop/my_project/CS_753/kaldi/tools/openfst-1.7.2/bin/fstcompose F.fst 3gram.fst FoL.fst