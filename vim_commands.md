# Vim Commands

## External commands
Can be used for running pytest from within vim.  the `%` flag denotes to path to the current file
```
:! {cmd} # run a shell command from within vim
:!!      # run last shell command input to vim
```

## Movements

```bash
f#{char}  # move forward # to nth occurance of a char
;         # move forward one more char
,         # move back one
```
