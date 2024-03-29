#!/bin/bash

rm -f trad.fst trad.pdf
rm -f onion.fst onion.pdf cabbage.fst cabbage.pdf potato.pdf potato.fst
rm -f couve.fst couve.pdf cebola.fst cebola.pdf batata.fst batata.pdf
rm -f *.pdf

################### letras ################
#
# Compila e gera a versão gráfica do transdutor que tem "potato"
fstcompile --isymbols=letras.sym --osymbols=letras.sym  potato.txt  > potato.fst
fstdraw  --isymbols=letras.sym --osymbols=letras.sym  potato.fst | dot -Tpdf > potato.pdf

fstcompile --isymbols=letras.sym --osymbols=letras.sym  cabbage.txt  > cabbage.fst
fstdraw  --isymbols=letras.sym --osymbols=letras.sym  cabbage.fst | dot -Tpdf > cabbage.pdf

fstcompile --isymbols=letras.sym --osymbols=letras.sym  onion.txt  > onion.fst
fstdraw  --isymbols=letras.sym --osymbols=letras.sym  onion.fst | dot -Tpdf > onion.pdf


################### Tradutores de tradução ################
#
# Compila e gera a versão gráfica do transdutor que traduz letra a letra
fstcompile  --isymbols=letras.sym --osymbols=letras.sym  trad.txt > trad.fst
fstdraw --isymbols=letras.sym --osymbols=letras.sym  trad.fst | dot -Tpdf > trad.pdf


################### Testa os tradutores ################
#
# Compila e gera a versão gráfica do transdutor que traduz Inglês em Português
fstcompose potato.fst trad.fst > batata.fst
fstdraw --isymbols=letras.sym --osymbols=letras.sym  batata.fst | dot -Tpdf > batata.pdf

fstcompose cabbage.fst trad.fst > couve.fst
fstdraw --isymbols=letras.sym --osymbols=letras.sym  couve.fst | dot -Tpdf > couve.pdf

fstcompose onion.fst trad.fst > cebola.fst
fstdraw --isymbols=letras.sym --osymbols=letras.sym  cebola.fst | dot -Tpdf > cebola.pdf
