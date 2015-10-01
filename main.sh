#main automata generation
rm *.fst Tests/*.fst
rm *.pdf
./compile common_time
./compile only_hours
./join common_time only_hours hours

./compile middle


./compile only_minutes
./compile tens
./compile units
./compile tens2
./concat tens units temp
./join temp tens2 temp2
./join temp2 only_minutes minutes
./join minutes common_time minutes


./concat hours middle half
./concat half minutes total

#tests
./test half Tests/test1 result; evince result.pdf
./test half Tests/test2 result; evince result.pdf

./test total Tests/test3 result; evince result.pdf
