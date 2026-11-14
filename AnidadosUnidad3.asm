; Materia: Lenguajes de Interfaz
; Alumno: Osuna Monarrez Aldahir
; Horario: 8-9
; Docente: Dr José Luis Medina Jiménez
; Práctica: 2

INCLUDE Irvine32.inc

.data
msgMain BYTE "1. Entrando a MAIN: ", 0
msgA BYTE "2. rutina A", 0
msgB BYTE "3. rutina B", 0 
msgRegresoA BYTE "4. Regreso a Rutina A", 0
msgFIN BYTE "5. Regreso a MAIN", 0 

.code
main PROC

    mov edx, OFFSET msgMain
    call WriteString
    call Crlf

    mov eax, 0

    ; CALL guarda en la pila la direccion para regresar a main.
    call RutinaA

continuacionMain:
    nop                     ; Aqui continua al regresar de A.

    mov edx, OFFSET msgFin
    call WriteString
    call Crlf

    call WaitMsg
    exit

main ENDP


RutinaA PROC

    mov edx, OFFSET msgA
    call WriteString
    call Crlf

    ; Guarda otra direccion de retorno en la pila.
    call RutinaB

continuacionA:
    nop                     ; Aqui continua al regresar de B.

    mov edx, OFFSET msgRegresoA
    call WriteString
    call Crlf

    ; Recupera la direccion guardada por CALL RutinaA.
    ret

RutinaA ENDP


RutinaB PROC

    ; Al momento detenerse aqui:
    ; [ESP]   contiene el retorno a continuacionA.
    ; [ESP+4] contiene el retorno a continuacionMain.
    nop

    mov edx, OFFSET msgB
    call WriteString
    call Crlf

    ; Recupera la direccion guardada por CALL RutinaB.
    ret

RutinaB ENDP

END main
