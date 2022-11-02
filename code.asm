[org 0x0100] 
 jmp start 
message: db 'Catch And Score'
message2: db 'Press Enter To Continue'
score:db 'SCORE:';6
lenght_sc: dw 6
length: dw 15
length2: dw 23


Square:
    push bp
    mov bp,sp
    push es
    push ax
    push di
    push cx
    mov ax, 0xb800 
    mov es, ax  
    mov di,[bp+8]
    mov ax,[bp+6]
    mov cx,[bp+4]
    cld
    rep stosw
    pop cx
    pop di
    pop ax
    pop es
    pop bp
    ret 6
color:  
push bp
mov bp,sp
push es
push ax
push di
push cx
mov ax, 0xb800 
 mov es, ax  
 mov di, [bp+8] 
 mov ax,[bp+6]
;mov al,0x20
 mov cx,[bp+4]
 cld
 rep stosw
 pop cx
 pop di
 pop ax
 pop es
 pop bp
 ret 4


clrscr: 
push bp
mov bp,sp
push es
push ax
push di
push cx

mov ax, 0xb800 
 mov es, ax  
 mov di, 0  
 mov ah,[bp+4]
mov al,0x20
 mov cx,2000
 cld
 rep stosw
 pop cx
 pop di
 pop ax
 pop es
 pop bp
 ret 2


printstr: push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 mov ax, 0xb800 
 mov es, ax
 mov al, 80 
 mul byte [bp+10]
 add ax, [bp+12] 
 shl ax, 1 
 mov di,ax 
 mov si, [bp+6] 
 mov cx, [bp+4] 
 mov ah, [bp+8] 

 cld 
nextchar: lodsb 
 stosw 
 loop nextchar
 pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10 




start: 
    mov ax,0x0030 ;; Blue BackGround
    push ax
    call clrscr 
    mov ax, 30
    push ax 
    mov ax, 12 
    push ax
    mov ax, 7
    push ax 
    mov ax, message
    push ax 
    push word [length] 
   ;; call printstr
    mov ax, 30
    push ax 
    mov ax, 16 
    push ax
    mov ax, 7
    push ax 
    mov ax, message2 
    push ax 
    push word [length2] 
    ;;call printstr
    mov di,3200
    push di
    mov ax,0x2020
    push ax
    mov ax,2000
    push ax
    call color;; For Grass Green
    mov di,2626
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color 
    mov di,2786
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color 
    mov di,2946
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color  ;;  
    mov di,3106
    push di
    mov ax,0x4520
    push ax
    mov ax,10
    push ax
    call color
    mov di,2644
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color 
    mov di,2804
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color 
    mov di,2964
    push di
    mov ax,0x4520
    push ax
    mov ax,1
    push ax
    call color
    mov di,880
    push di
    mov ax,0x5020
    push ax
    mov ax,4
    push ax
    call Square
    mov di,380
    push di
    mov ax,0x5020
    push ax
    mov ax,4
    push ax
    call Square
    mov di,740
    push di
    mov ax,0x5020
    push ax
    mov ax,4
    push ax
    call Square
    mov di,860
    push di
    mov ax,0x5020
    push ax
    mov ax,4
    push ax
    call Square
    mov cx,8
    mov di,140
   l1:
    push di
    mov ax,0x6020
    push ax
    mov ax,10
    push ax
    call Square
    add di,160
    sub cx,1
    cmp cx,0
    jnz l1
    mov ax,70
    push ax
    mov ax,0
    push ax
    mov ax,0x0060
    push ax
    mov ax,score
    push ax
    push word[lenght_sc]
    call printstr
 mov ax, 0x4c00
 int 0x21
