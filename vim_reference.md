# VIM Reference

## Navigating Help

| cmd | explanation |
|---|---|
| Ctrl-] | follow link |
| Ctrl-t | back |

## Searching

| cmd | explanation | example |
|---|---|---|
| < > | word boundary | :%s/\<word\> finds word but not sword |

## Mappings

| cmd | explanation | example |
|---|---|---|
| :map | make a custom mapping | :map tt :w \<bar\> :!pytest %\<cr\> |
| :unmap | un map | :unmap tt |
| :imap | insert mode mapping | :imap rkni Robert Knight |
| :iunmap | un imap | :iunmap rkni |

## Macros

| cmd | explanation | example |
|---|---|---|
| q\<reg\> | record a macro | qaI# \<esc\>jq |
| @\<reg\> | play macro | @a |
| @@ | replay last macro |
| \<repeat\>@\<reg\> | run macro mulitple times | 22@a |
|:'<,'>normal @<reg> | run macro in parrallel over visual block |
|:.,$normal . | apply the dot command to every line from current to end of file|

## Ex comands

| cmd | explanation | example |
|---|---|---|
| :\<start\>,\<end\>m\<new\> | move lines in range to new location | :1,5m$ |
| :\<start\>,\<end\>f\<new\> | copy (`to`) lines in range to new location | :1,5t$ |
| $ | end of file | :.t$ |
| . | current line | :.t$ |
| 0 | start of the file | :.t0 |
| +/-\<n\> | n lines before or after some | :-10,-5t. |

## Ex comands2

[good video](https://www.youtube.com/watch?v=JgZu5-FNeMk)

| cmd | explanation | example |
|---|---|---|
| :\<location\>read \<command\> | insert into vim the result of a command | :0read !date |
| :g/\<pattern\>/\<command\> | run the command on every line matching a pattern | :g/^\s\*$/d |
| :g!/\<pattern\>/\<command\> | run the command on every line not matching a pattern | :g!/^\s\*$/normal A; |


