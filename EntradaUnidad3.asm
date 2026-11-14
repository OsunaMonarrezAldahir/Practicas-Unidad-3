; Materia: Lenguajes de Interfaz
; Alumno: Osuna Monarrez Aldahir
; Horario: 8-9
; Docente: Dr José Luis Medina Jiménez
; Práctica: 3

INCLUDE Irvine32.inc

.data
; Mensajes para identificar cada prueba y su resultado.
mensajeCaso1 BYTE "Caso 1: ECX = 0", 0
mensajeCaso2 BYTE "Caso 2: ECX = 7", 0
mensajeInvalido BYTE "EAX = 0: Entrada vacia", 0
mensajeValido BYTE "EAX = 1: Entrada no vacia", 0

.code
main PROC

    ; CASO 1: Simular una entrada vacia.
    mov edx, OFFSET mensajeCaso1
    call WriteString                ; Mostrar el caso que se probara.
    call Crlf

    mov ecx, 0                      ; Longitud simulada: cero caracteres.
    call ValidarNoVacia              ; Devolver el estado en EAX.

    ; Comprobar el estado devuelto por el procedimiento.
    test eax, eax                   
    jz entradaInvalida1             

    mov edx, OFFSET mensajeValido
    call WriteString                ; Mostrar que la entrada no esta vacia.
    jmp segundoCaso                 ; Evitar el mensaje de entrada invalida.

entradaInvalida1:
    mov edx, OFFSET mensajeInvalido
    call WriteString                ; Mostrar que la entrada esta vacia.

segundoCaso:
    call Crlf
    call Crlf                       

    ; CASO 2: Simular una entrada de siete caracteres.
    mov edx, OFFSET mensajeCaso2
    call WriteString
    call Crlf

    mov ecx, 7                     
    call ValidarNoVacia             
    test eax, eax                   
    jz entradaInvalida2              

    mov edx, OFFSET mensajeValido
    call WriteString                
    jmp finPrograma                 

entradaInvalida2:
    mov edx, OFFSET mensajeInvalido
    call WriteString                

finPrograma:
    call Crlf
    call WaitMsg                    
    exit                           

main ENDP

ValidarNoVacia PROC

    cmp ecx, 0                     
    je esVacia                      

    mov eax, 1                     
    ret                             

esVacia:
    mov eax, 0                     
    ret                            
ValidarNoVacia ENDP

END main
