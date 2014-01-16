;/*
;            Copyright Oliver Kowalke 2009.
;   Distributed under the Boost Software License, Version 1.0.
;      (See accompanying file LICENSE_1_0.txt or copy at
;          http://www.boost.org/LICENSE_1_0.txt)
;*/

;/*******************************************************************
; *                                                                 *
; *  -------------------------------------------------------------  *
; *  |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  *
; *  -------------------------------------------------------------  *
; *  | 0x0 | 0x4 | 0x8 | 0xc | 0x10| 0x14| 0x18| 0x1c| 0x20| 0x24|  *
; *  -------------------------------------------------------------  *
; *  |  v1 |  v2 |  v3 |  v4 |  v5 |  v6 |  v7 |  v8 |  sp |  lr |  *
; *  -------------------------------------------------------------  *
; *  -------------------------------------------------------------  *
; *  |  10 |                                                     |  *
; *  -------------------------------------------------------------  *
; *  | 0x28|                                                     |  *
; *  -------------------------------------------------------------  *
; *  |  pc |                                                     |  *
; *  -------------------------------------------------------------  *
; *  -------------------------------------------------------------  *
; *  |  11 |  12 |                                               |  *
; *  -------------------------------------------------------------  *
; *  | 0x2c| 0x30|                                               |  *
; *  -------------------------------------------------------------  *
; *  |  sp | size|                                               |  *
; *  -------------------------------------------------------------  *
; *  -------------------------------------------------------------  *
; *  |  13 |  14 | 15 |  16 |  17 |  18 |  19 |  20 |  21 |  22  |  *
; *  -------------------------------------------------------------  *
; *  | 0x34| 0x38|0x3c| 0x40| 0x44| 0x48| 0x4c| 0x50| 0x54| 0x58 |  *
; *  -------------------------------------------------------------  *
; *  | s16 | s17 | s18 | s19 | s20 | s21 | s22 | s23 | s24 | s25 |  *
; *  -------------------------------------------------------------  *
; *  -------------------------------------------------------------  *
; *  |  23 |  24 |  25 |  26 |  27 |  28 |                       |  *
; *  -------------------------------------------------------------  *
; *  | 0x5c| 0x60| 0x64| 0x68| 0x6c| 0x70|                       |  *
; *  -------------------------------------------------------------  *
; *  | s26 | s27 | s28 | s29 | s30 | s31 |                       |  *
; *  -------------------------------------------------------------  *
; *                                                                 *
; * *****************************************************************/

    AREA |.text|, CODE
    ALIGN 4
    EXPORT copp_jump_fcontext

copp_jump_fcontext PROC
    stmia   a1, {r4-r11,sp-lr}      ; save V1-V8,SP-LR
    str     lr, [a1,#40]            ; save LR as PC

    mov     a1, a3                  ; use third arg as return value after jump
                                    ; and as first arg in context function
    ldmia   a2, {r4-r11,sp-pc}      ; restore v1-V8,SP-PC

    ENDP
    END