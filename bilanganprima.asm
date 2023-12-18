# Program ini adalah program bilangan prima sederhana yang meminta input dari pengguna.
# Setelah input diterima, program akan memeriksa apakah bilangan tersebut prima atau bukan.
# Setelahnya, program akan menampilkan pesan sesuai dengan hasil pemeriksaan.

.MODEL SMALL
.STACK 100H
.DATA
    MSG_WELCOME DB 10, 13, 'Halo, selamat datang di program bilangan prima.', '$'
    MSG_INPUT DB 10, 13, 'Masukkan bilangan: $'
    MSG_NOT_PRIME DB 10, 13, 'Ini bukan bilangan prima.$'
    MSG_PRIME DB 10, 13, 'Ini bilangan prima.$'
    MSG_THANKS DB 10, 13, 'Terima kasih telah menggunakan program ini Hasanul Bashori 064002300041.', '$'
    MSG_PRESS_ENTER DB 10, 13, 'Tekan Enter untuk keluar.', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    # Menampilkan pesan selamat datang
    MOV DX, OFFSET MSG_WELCOME
    MOV AH, 09H
    INT 21H

    # Meminta input bilangan dari pengguna
    MOV DX, OFFSET MSG_INPUT
    MOV AH, 09H
    INT 21H

    MOV BH, 0
    MOV BL, 10D

INPUT:
    MOV AH, 01H
    INT 21H
    CMP AL, 13D
    JNE NUMBER

    JMP CHECK

NUMBER:
    # Mengolah input untuk mendapatkan bilangan
    SUB AL, 30H
    MOV CL, AL
    MOV AL, BH
    MUL BL
    ADD AL, CL
    MOV BH, AL

    JMP INPUT

CHECK:
    CMP BH, 1
    JLE NOT_PRIME

    MOV CX, 2
    AND AX, 0
    AND DX, 0

    MOV AL, BH
    DIV CX

    MOV CX, AX ; DX:AX / CX = REM = DX , QUE = AX

ISPRIME:
    CMP CX, 2
    JL PRIME
    AND AX, 0
    AND DX, 0 ; DX:AX / CX = REM = DX , QUE = AX
    MOV AL, BH
    DIV CX
    DEC CX
    CMP DX, 0
    JE NOT_PRIME
    JMP ISPRIME

PRIME:
    # Menampilkan pesan bahwa bilangan adalah prima
    MOV AH, 09H
    MOV DX, OFFSET MSG_PRIME
    INT 21H

    # Menampilkan pesan terima kasih
    MOV DX, OFFSET MSG_THANKS
    INT 21H

    JMP PRESS_ENTER

NOT_PRIME:
    # Menampilkan pesan bahwa bukan bilangan prima
    MOV AH, 09H
    MOV DX, OFFSET MSG_NOT_PRIME
    INT 21H

PRESS_ENTER:
    # Menampilkan pesan tekan Enter untuk keluar
    MOV DX, OFFSET MSG_PRESS_ENTER
    MOV AH, 09H
    INT 21H

    # Menunggu tekanan Enter sebelum keluar
    MOV AH, 01H
    INT 21H

EXIT:
    # Keluar dari program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
