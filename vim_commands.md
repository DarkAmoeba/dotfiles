# Vim Commands

## Registers & Macors
|register|description|
|---|---|
|"|The unnamed register is special in that it’s always written to in operations, no matter whether you specified another register or not|
|0|yank register, pasting the text yanked with "0p|
|1-9|The registers 1 through 9 are for deleted text, with "1 referencing the most recently deleted text, "2 the text deleted before that, and so on up to "9.|
|a-z|named registers|

```vim
:reg     " view content of all registers
"ayy     " yank line into register a
"aP      " paste register before cursor
qb       " record into register b, press q again to stop recording
@b       " execute register b 
```
to edit the content of a register paste it into a new buffer, edit it and then save it off
```vim
:vs      " split and create a new buffer
"ap      " paste reg a into buffer and edit as required
^"ay$    " paste register before cursor
```

## External commands
Can be used for running pytest from within vim.  the `%` flag denotes to path to the current file
```vim
:! {cmd} " run a shell command from within vim
:!!      " run last shell command input to vim
```

## Movements

```vim
f#{char} " move forward # to nth occurance of a char
;        " move forward one more char
,        " move back one
```
