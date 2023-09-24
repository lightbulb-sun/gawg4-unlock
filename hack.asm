.gba
.open "hack.gba", 0x08000000

FLAG_MUSEUM_UNLOCKED        equ 0x0e000426
FLAG_MANHOLE_UNLOCKED       equ 0x0e000328
NUM_MUSEUM_GAMES            equ 9

.thumb

; main games
.org 0x080c1bf8
        b       0x080c1c6c

; museum
.org 0x08094942
        bl      unlock_museum

.org 0x083f8000
unlock_museum:
        push    {r2-r5,lr}
        mov     r2, 1
        ldr     r3, =FLAG_MUSEUM_UNLOCKED
        strb    r2, [r3]
.unlock_museum_games:
        ldr     r3, =FLAG_MANHOLE_UNLOCKED
        mov     r2, 0
        mov     r4, 2
.loop:
        strb    r4, [r3]
        add     r2, 1
        add     r3, 4
        cmp     r2, NUM_MUSEUM_GAMES
        bne     .loop

        pop     {r2-r5}

        ; replace original instruction
        bl      0x0803f70c

        pop     r2
        bx      r2
.pool

.close
