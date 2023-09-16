    org 0
    incbin "strider.md"

    org $3c64
            jsr     restore_ha

    org $de68
            jmp     restore_all_sons

    org $ff000
restore_ha:
            jsr     $200f8
            ; replace original instruction
            move.b  #1, $ffe198
            rts

restore_all_sons:
            ; replace original instruction
            tst.b   ($32, a0)
            bne     .cont
            jsr     $20128
            jmp     $de74
.cont
            jsr     $20140
            jmp     $de74
