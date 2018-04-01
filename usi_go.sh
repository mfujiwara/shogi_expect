#!/bin/sh

cd ~/dev/Gikou/bin/
expect -c "
set timeout 3600
spawn ~/dev/Gikou/bin/release
send \"usi\n\"
expect \"usiok\"
send \"setoption name DepthLimit value 60\n\"
send \"isready\n\"
expect \"readyok\"
send \"position startpos moves 7g7f 3c3d 6g6f 5a4b 2g2f 3a3b 4i5h 3b3c 7i6h 4b3b 6h7g 4c4d 5g5f 6a5b 8h7i 5b4c 3i4h 5c5d 5h6g 8c8d 5i6h 8d8e 6h7h 7a7b 3g3f 7b8c 3f3e 3d3e 7i3e P*3d 3e6h 8c8d 7g8h 9c9d 9g9f 2b3a 6f6e 3b2b 2i3g 4a3b 1g1f 1c1d 1i1g 7c7d 6h4f 8d7c 8h7g 8b6b 6i6h 9a9b 1f1e 1d1e P*1c 3c2d 6e6d 6c6d 4f2d 2c2d 2f2e 2d2e 1g1e B*2f S*2d 3a4b P*2c 2b3a 2h2f 2e2f 1c1b+ 4b2d 2c2b+ 3b2b 1b2b 3a2b 1e1a+ 2b1a G*2c 2d6h+ 7g6h G*2b L*2e 2b2c 2e2c+ G*2b G*2d 2b2c 2d2c S*1b B*4a 1b2c 4a2c+ G*2b B*4a L*3b S*5a 6b8b G*2d 4c3c 2d3c 3b3c G*2d L*3b 2c2b 1a2b G*4b B*2c 3g2e 8e8f 8g8f R*1i 4h5i 8b8f P*8g 8f8b 2e3c+ 2a3c 4b4c N*2a 5a4b+ G*1b 4b3b 2c3b 4c3b 8b3b B*4c S*3a 4c5d+ 2f2g+ 4a3b+ 3a3b R*5b G*4a 5b9b+ P*2c 2d3d P*8f 8g8f P*8g 7h8g P*5h 5d5e 5h5i+ 5e1i 5i6i R*7a P*5a L*4c 4a3a 7a5a+ 2b1c L*1f P*1d 1i4f S*2d 5a3a B*2e 3d2d 2c2d 3a3b G*2b 3b3a 2e4c G*3e L*2c P*2e 6i6h L*1i S*7h 8g9g\n\"
send \"go\n\"
expect \"bestmove\"
send \"quit\n\"
"
