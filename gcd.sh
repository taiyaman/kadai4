#!/bin/bash
#
# 数字かどうかをチェックする関数
is_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    else
        return 0
    fi
}

# 2つの数値が引数として与えられているかチェック
if [ "$#" -ne 2 ]; then
    echo "Error: Exactly two natural numbers are required"
    exit 1
fi

# 引数が数字かどうかチェック
if ! is_number $1 || ! is_number $2 ; then
    echo "Error: Both arguments must be natural numbers"
    exit 1
fi

# ユークリッドのアルゴリズムで最大公約数を計算
gcd() {
    if [ $2 -eq 0 ]; then
        echo $1
    else
        gcd $2 $(($1 % $2))
    fi
}

# 最大公約数を出力
echo $(gcd $1 $2)
