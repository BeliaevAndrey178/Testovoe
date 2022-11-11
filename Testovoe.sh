#!/bin/bash
curl https://jsonplaceholder.typicode.com/todos > Test_File
Text1=$(cat Test_File | grep 'delectus aut autem' | awk -F ' "title": "' '{print $2}'| sed 's/,$//' | sed ' s/\"$//')
Text2=$(cat Test_File | grep 'quis ut nam facilis et officia qui' | awk -F ' "title": "' '{print $2}'| sed 's/,$//' | sed ' s/\"$//')
my_string="$Text1 $Text2"
echo $my_string 
my_array=($(echo $my_string | tr " " "\n"))
for i in "${my_array[@]}"
do
    echo $i >>Text2.txt
done
sort Text2.txt > Text3.txt

