#!/bin/sh

_run() {
  cat - | _calc | _mate_to_score | awk 'NR%2==1{print $1} NR%2==0{print -1 * $1}'
}

_calc() {
  array=""
  for var in `cat -`
  do
    array="$array $var"
    ./usi_score.sh "$array"
  done
}

_mate_to_score() {
  cat - | awk '$2=="mate" && $3%2==0{print 99999} $2=="mate" && $3%2==1{print -99999} $2=="cp"{print -1 * $3}'
}

if [ $# -ne 0 ]; then
  cat ${@+"$@"}
elif [ -p /dev/stdin ]; then
  cat -
fi | ./dojo24_to_moves.sh | _run
