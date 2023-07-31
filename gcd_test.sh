#!/bin/bash

# 日付を含むログファイルの名前を変数にセットします
error_log="/tmp/$$-error_$(date +%Y%m%d).log"
success_log="/tmp/$$-success_$(date +%Y%m%d).log"

#正常な入力（2つの自然数）に対するテスト
#引数が60と48のケース
output=$(./gcd.sh 60 48)
expected_output="12"

if [ "$output" -eq "$expected_output" ]; then
    echo "Test case passed! test4-1" >> $success_log
else
    echo "Test case failed! test4-1" >> $error_log 
fi

#引数が2つではない場合のテスト
#引数が1つしかない
output=$(./gcd.sh 60)
expected_output="Error: Exactly two natural numbers are required"

if [ "$output" == "$expected_output" ]; then
    echo "Test case passed! test4-2" >> $success_log 
else
    echo "Test case failed! test4-2" >> $error_log 
fi

#引数が自然数ではない場合のテスト
#第一引数が60、第二引数がabc
output=$(./gcd.sh 60 abc)
expected_output="Error: Both arguments must be natural numbers"

if [ "$output" == "$expected_output" ]; then
    echo "Test case passed! test4-3" >> $success_log 
else
    echo "Test case failed! test4-3" >> $error_log 
fi

#引数が3つ以上の場合
#第一引数が10、第二引数が20、第三引数が30
output=$(./gcd.sh 10 20 30)
expected_output="Error: Exactly two natural numbers are required"

if [ "$output" == "$expected_output" ]; then
    echo "Test case passed! test4-4" >> $success_log 
else
    echo "Test case failed! test4-4" >> $error_log 
fi

#引数にマイナスがある場合
#第一引数が－5、第二引数が10
output=$(./gcd.sh -5 10)
expected_output="Error: Both arguments must be natural numbers"

if [ "$output" == "$expected_output" ]; then
    echo "Test case passed! test4-5" >> $success_log 
else
    echo "Test case failed! test4-5" >> $error_log 
fi

#引数が無い場合
output=$(./gcd.sh)
expected_output="Error: Exactly two natural numbers are required"

if [ "$output" == "$expected_output" ]; then
    echo "Test case passed! test4-6" >> $success_log 
else
    echo "Test case failed! test4-6"  >> $error_log 
fi

if [ -f $error_log ];then
         cat $error_log 1>&2
         rm -f /tmp/$$-*
         exit 1
fi
