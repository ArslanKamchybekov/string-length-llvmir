define i32 @string_length(i8* %str) {
entry:
  ; Initialize counter to 0
  %length = alloca i32
  store i32 0, i32* %length
  
  ; Loop through the string
  br label %loop_check

loop_check:
  ; Load current character
  %current_char = load i8, i8* %str
  
  ; Check for null terminator
  %is_null = icmp eq i8 %current_char, 0
  br i1 %is_null, label %loop_exit, label %loop_body

loop_body:
  ; Increment counter
  %current_length = load i32, i32* %length
  %new_length = add i32 %current_length, 1
  store i32 %new_length, i32* %length
  
  ; Move to the next character
  %next_ptr = getelementptr i8, i8* %str, i32 1
  store i8* %next_ptr, i8** %str
  
  br label %loop_check

loop_exit:
  ; Return the length
  %final_length = load i32, i32* %length
  ret i32 %final_length
}