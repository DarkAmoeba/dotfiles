# VIM Reference

## Navigating Help

| cmd | explanation |
|---|---|
| Ctrl-] | follow link |
| Ctrl-t | back |

## Searching

| cmd | explanation | example |
|---|---|---|
| < > | word boundary | :%s/<word> finds word but not sword |

## Mappings

| cmd | explanation | example |
|---|---|---|
| :map | make a custom mapping | :map tt :w <bar> :!pytest %<cr> |
| :unmap | un map | :unmap tt |
| :imap | insert mode mapping | :imap rkni Robert Knight |
| :iunmap | un imap | :iunmap rkni |

## Macros

| cmd | explanation | example |
|---|---|---|
| q<reg> | record a macro | qaI# <esc>jq |
| @<reg> | play macro | @a |
| @@ | replay last macro |
| <repeat>@<reg> | run macro mulitple times | 22@a |
|:'<,'>nomal @<reg> | run macro in parrallel over visual block |
