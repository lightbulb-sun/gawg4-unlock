.gba
.open "hack.gba", 0x08000000

.org 0x080c1bf8
.thumb
        b       0x080c1c6c

.close
