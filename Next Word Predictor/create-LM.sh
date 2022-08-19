#! /bin/bash

/mnt/c/Users/PUKHRAJ/Desktop/my_project/CS_753/srilm/bin/i686-m64/ngram-count -order 3 -debug 2 -unk -map-unk "<UNK>" -vocab $1 -gt1min 1 -gt2min 2 -gt3min 2 -gt4min 2 -kndiscount1 -kndiscount2 -kndiscount3 -kndiscount4 -text news.2011.en.shuffled -lm L.arpa
/mnt/c/Users/PUKHRAJ/Desktop/my_project/CS_753/kaldi/src/lmbin/arpa2fst --disambig-symbol=#0 --write-symbol-table=symbol_vocab.txt L.arpa L.fst