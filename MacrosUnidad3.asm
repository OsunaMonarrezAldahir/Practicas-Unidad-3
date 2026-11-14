; Materia: Lenguajes de Interfaz
; Alumno: Osuna Monarrez Aldahir
; Horario: 8-9
; Docente: Dr José Luis Medina Jiménez
; Práctica: 5


INCLUDE Irvine32.inc

; Macro para mostrar un mensaje.
mostrarMensaje MACRO texto
    mov edx, OFFSET texto
    call WriteString
    call Crlf
ENDM

; Macro para multiplicar dos cantidades.
multiplicar MACRO cantidad1, cantidad2
    mov eax, cantidad1
    mov ebx, cantidad2
    mul ebx
ENDM
; Comentarios que le mostraremos al usuario
.data
mensajeBienvenida BYTE "bienvenido al sistema de ventas: ", 0
mensajeFin BYTE "hasta luego, vuelva pronto", 0

; Datos que seran multiplicados por la macro
numero1 DWORD 7
numero2 DWORD 8
mensajeResultado BYTE "Resultado de la multiplicacion: ", 0

.code
main PROC

    mostrarMensaje mensajeBienvenida
    mostrarMensaje mensajeFin

    mostrarMensaje mensajeResultado

    ; Calcular y mostrar el resultado.
    multiplicar numero1, numero2
    call WriteDec
    call Crlf

    exit

main ENDP
END main
