#!/bin/sh

cd ~/dev/Gikou/bin/

_run() {
  k=1
  _go "$1" | _score |  awk 'match($0, /score (cp|mate) [\-0-9]*/){print substr($0, RSTART, RLENGTH)}'
}

_score() {
  cat - | grep "^info" | tail -n 1
}
_go() {
  expect -c "
    set timeout 3600
    spawn ~/dev/Gikou/bin/release
    send \"usi\n\"
    expect \"usiok\"
    send \"setoption name DepthLimit value 5\n\"
    send \"isready\n\"
    expect \"readyok\"
    send \"position startpos moves $1\n\"
    send \"go\n\"
    expect \"bestmove\"
    send \"quit\n\"
  "
}

_run "$1"
