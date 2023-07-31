#!/bin/bash
# error用関数
ERROR_EXIT() {
         echo $1 1>&2
         rm -f /tmp/$$-*
         exit 1
}

#入力数が少ない場合
#入力なし
#入力1個
#入力3個以上

#自然数以外が入力されて場合

#最大公約数が計算できているか
#2 4 -> 2
echo "2" > /tmp/$$-ans
/home/yama0131/kadai4/gcd_calculator.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト3‐1" >> /tmp/$$-error.log

if [ -f /tmp/$$-error.log ];then
         cat /tmp/$$-error.log 1>&2
         rm -f /tmp/$$-*
         exit 1
fi

rm  -f /tmp/$$-result
