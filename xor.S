.intel_syntax noprefix // Use Intel syntax
.global xor_cipher     // Make xor_cipher global

.text                  // Start of text section


// xor_cipher: Takes a string and a key and xors the string with the key
// calling convention:
//   rdi: string
//   rsi: key
// more parameter: rdx, rcx, r8, r9, Stack…
xor_cipher:
    mov rax, rdi
    mov rbx, rsi

    // rcx: counter
    mov rcx, 0

// loop: Loop above the string
loop:
    // Check if we are at the end of the string
    mov dl, [rax + rcx]
    cmp dl, 0
    je end

    // Xor the current character with the key
    mov dl, [rax + rcx]
    xor dl, bl
    mov [rax + rcx], dl

    // Increment the counter and jmp back to loop start
    inc rcx
    jmp loop

// end: End of xor_cipher
end:
    ret
