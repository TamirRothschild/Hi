section .data
    msg db 'Hello World!', 0x0D, 0x0A, '$'
    len_msg equ $ - msg
    char_ptr db 0    

    H_char db 'H'
    e_char db 'e'
    l1_char db 'l'
    l2_char db 'l'
    o_char db 'o'
    W_char db 'W'
    o2_char db 'o'
    r_char db 'r'
    l3_char db 'l'
    d_char db 'd'
    space db ' '
    exclamation db '!'


    newline db 0x0D, 0x0A


section .bss
    temp_char resb 1
    temp_res resd 1
    counter resd 1
    result resd 1
    index resd 1
    temp_ptr resd 1
    loop_counter resd 1

section .text
    global _start

_start:
    call init_str_ptr
    call init_counter
    call init_index
    call init_loop_counter

main_loop:
    call check_end_of_string
    cmp eax, 1
    je end_program
    call get_char_at_position

    call check_if_H
    cmp eax, 1
    je handle_H

    call check_if_e
    cmp eax, 1
    je handle_e

    call check_if_l1
    cmp eax, 1
    je handle_l1

    call check_if_l2
    cmp eax, 1
    je handle_l2

    call check_if_o
    cmp eax, 1
    je handle_o

    call check_if_W
    cmp eax, 1
    je handle_W

    call check_if_o2
    cmp eax, 1
    je handle_o2

    call check_if_r
    cmp eax, 1
    je handle_r

    call check_if_l3
    cmp eax, 1
    je handle_l3

    call check_if_d
    cmp eax, 1
    je handle_d

    call check_if_space
    cmp eax, 1
    je handle_space

    call check_if_exclamation
    cmp eax, 1
    je handle_exclamation
    call print_char
    call increment_counter
    jmp main_loop

handle_H:
    call print_H
    call increment_counter
    jmp main_loop

handle_e:
    call print_e
    call increment_counter
    jmp main_loop

handle_l1:
    call print_l1
    call increment_counter
    jmp main_loop

handle_l2:
    call print_l2
    call increment_counter
    jmp main_loop

handle_o:
    call print_o
    call increment_counter
    jmp main_loop

handle_W:
    call print_W
    call increment_counter
    jmp main_loop

handle_o2:
    call print_o2
    call increment_counter
    jmp main_loop

handle_r:
    call print_r
    call increment_counter
    jmp main_loop

handle_l3:
    call print_l3
    call increment_counter
    jmp main_loop

handle_d:
    call print_d
    call increment_counter
    jmp main_loop

handle_space:
    call print_space
    call increment_counter
    jmp main_loop

handle_exclamation:
    call print_exclamation
    call increment_counter
    jmp main_loop

end_program:
    mov eax, 1       
    xor ebx, ebx       
    int 0x80

init_str_ptr:
    mov eax, msg
    mov [temp_ptr], eax
    ret

init_counter:
    mov dword [counter], 0
    ret

init_index:
    mov dword [index], 0
    ret

init_loop_counter:
    mov dword [loop_counter], 0
    ret

check_end_of_string:
    mov eax, [temp_ptr]
    add eax, [counter]
    mov al, [eax]
    mov [char_ptr], al

    cmp al, '$'
    jne continue_string
    mov eax, 1               
    ret

continue_string:
    mov eax, 0              
    ret

get_char_at_position:
    mov eax, [temp_ptr]
    add eax, [counter]
    mov al, [eax]
    ret

check_if_H:
    cmp al, 'H'
    mov eax, 0
    jne not_H
    mov eax, 1
not_H:
    ret

check_if_e:
    cmp al, 'e'
    mov eax, 0
    jne not_e
    mov eax, 1
not_e:
    ret

check_if_l1:
    cmp al, 'l'
    mov eax, 0
    jne not_l1
    mov eax, 1
not_l1:
    ret

check_if_l2:
    cmp al, 'l'
    mov eax, 0
    jne not_l2
    mov eax, 1
not_l2:
    ret

check_if_o:
    cmp al, 'o'
    mov eax, 0
    jne not_o
    mov eax, 1
not_o:
    ret

check_if_W:
    cmp al, 'W'
    mov eax, 0
    jne not_W
    mov eax, 1
not_W:
    ret

check_if_o2:
    cmp al, 'o'
    mov eax, 0
    jne not_o2
    mov eax, 1
not_o2:
    ret

check_if_r:
    cmp al, 'r'
    mov eax, 0
    jne not_r
    mov eax, 1
not_r:
    ret

check_if_l3:
    cmp al, 'l'
    mov eax, 0
    jne not_l3
    mov eax, 1
not_l3:
    ret

check_if_d:
    cmp al, 'd'
    mov eax, 0
    jne not_d
    mov eax, 1
not_d:
    ret

check_if_space:
    cmp al, ' '
    mov eax, 0
    jne not_space
    mov eax, 1
not_space:
    ret

check_if_exclamation:
    cmp al, '!'
    mov eax, 0
    jne not_exclamation
    mov eax, 1
not_exclamation:
    ret

print_H:
    mov eax, 4         
    mov ebx, 1         
    mov ecx, H_char    
    mov edx, 1         
    int 0x80
    ret

print_e:
    mov eax, 4
    mov ebx, 1
    mov ecx, e_char
    mov edx, 1
    int 0x80
    ret

print_l1:
    mov eax, 4
    mov ebx, 1
    mov ecx, l1_char
    mov edx, 1
    int 0x80
    ret

print_l2:
    mov eax, 4
    mov ebx, 1
    mov ecx, l2_char
    mov edx, 1
    int 0x80
    ret

print_o:
    mov eax, 4
    mov ebx, 1
    mov ecx, o_char
    mov edx, 1
    int 0x80
    ret

print_W:
    mov eax, 4
    mov ebx, 1
    mov ecx, W_char
    mov edx, 1
    int 0x80
    ret

print_o2:
    mov eax, 4
    mov ebx, 1
    mov ecx, o2_char
    mov edx, 1
    int 0x80
    ret

print_r:
    mov eax, 4
    mov ebx, 1
    mov ecx, r_char
    mov edx, 1
    int 0x80
    ret

print_l3:
    mov eax, 4
    mov ebx, 1
    mov ecx, l3_char
    mov edx, 1
    int 0x80
    ret

print_d:
    mov eax, 4
    mov ebx, 1
    mov ecx, d_char
    mov edx, 1
    int 0x80
    ret

print_space:
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    ret

print_exclamation:
    mov eax, 4
    mov ebx, 1
    mov ecx, exclamation
    mov edx, 1
    int 0x80
    ret

print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 2
    int 0x80
    ret

print_char:
    mov eax, 4
    mov ebx, 1
    mov ecx, char_ptr
    mov edx, 1
    int 0x80
    ret

increment_counter:
    inc dword [counter]
    ret

increment_index:
    inc dword [index]
    ret

reset_loop_counter:
    mov dword [loop_counter], 0
    ret

loop_function1:
    mov ecx, [loop_counter]
    cmp ecx, 5
    inc dword [loop_counter]
    jmp loop_function1
