#!/bin/sh

_run() {
  cat - | sed -n "/^1 /,//p" | cut -f2 -d" " | _conv_split | _conv_same | _format
}

_conv_split() {
  sed -e 's/１/1/' -e 's/２/2/' -e 's/３/3/' -e 's/４/4/' -e 's/５/5/' -e 's/６/6/' -e 's/７/7/' -e 's/８/8/' -e 's/９/9/' \
    -e 's/一/a /' -e 's/二/b /' -e 's/三/c /' -e 's/四/d /' -e 's/五/e /' -e 's/六/f /' -e 's/七/g /' -e 's/八/h /' -e 's/九/i /' \
    -e 's/1)/a/' -e 's/2)/b/' -e 's/3)/c/' -e 's/4)/d/' -e 's/5)/e/' -e 's/6)/f/' -e 's/7)/g/' -e 's/8)/h/' -e 's/9)/i/' -e 's/(/ /' \
    -e 's/飛打/飛打 R*/' -e 's/角打/角打 B*/' -e 's/金打/金打 G*/' -e 's/銀打/銀打 S*/' -e 's/桂打/桂打 N*/' -e 's/香打/香打 L*/' -e 's/歩打/歩打 P*/' \
    -e 's/成 /+ /'
}

_conv_same() {
  input=`cat -`
  line_num=`echo "$input" | wc -l`
  for i in `seq 0 $line_num`
  do
    line=`echo "$input" | sed -n "${i}p" | sed -e "s/同　/$prev /"`
    echo "$line"
    prev=`echo "$line" | cut -d" " -f1`
  done
}

_format() {
  cat - | awk '{ print $3" "$1" "$2 }' | sed -e 's/[　-＂]//g' -e 's/ //g'
}

if [ $# -ne 0 ]; then
  cat ${@+"$@"}
elif [ -p /dev/stdin ]; then
  cat -
fi | _run | grep -v '^\s*$'
