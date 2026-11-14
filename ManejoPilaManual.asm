; Materia: Lenguajes de Interfaz
; Alumno: Osuna Monarrez Aldahir 
; Horario: 8-9
; Docente: Dr José Luis Medina Jiménez
; Práctica: 4


INCLUDE Irvine32.inc

.data
.code
main PROC
    mov ebx, 999

    push 3
    push 25

    call SumarPila
    nop ; Regreso del call SumarPila
    exit

main ENDP

SumarPila PROC
    push ebp ; cima de la pila
    mov ebp, esp

    push ebx

    mov eax, [ebp + 8] ; primer argumento
    mov ebx, [ebp + 12] ; segundo argumento

    imul eax, ebx ; multiplicar los argumentos

    pop ebx
    pop ebp

    ret 8 ; limpiar los argumentos de la pila

    SumarPila ENDP
    END main
    
