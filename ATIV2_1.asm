TITLE LETRA_MINUSCULA_PARA_MAIUSCULA
.MODEL SMALL

.DATA
    MSG1 DB "Digite uma letra minuscula: ", "$"
    MSG2 DB 10, 13,"A letra maiú=uscula correspondente é: ", "$"

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS, AX

        MOV AH,9
        LEA DX,MSG1
        INT 21h
        MOV AH,1
        INT 21h

        ; Pega a letra maiuscula 
        SUB AL, 20h

        ; Copia o caracter na forma maiuscula para BL
        MOV BL,AL

        ; Exibe o caracter Line Feed
        MOV AH,2
        MOV DL,10 
        INT 21h

        ; Exibe o caracter maiusculo que foi salvo em BL
        MOV AH, 9h
        MOV DX, OFFSET MSG2
        INT 21h
        MOV AH,2
        MOV DL,BL
        INT 21h

        ; Finaliza o programa
        MOV AH,4Ch
        INT 21h
    MAIN endp
END MAIN
