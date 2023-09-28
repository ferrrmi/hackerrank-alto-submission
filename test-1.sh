#!/usr/bin/env bash
read my_variable </dev/stdin

firstString="processed"
# echo "${my_variable/replaceme/"$firstString"}"   -> for 1 string

echo "${my_variable//replaceme/"$firstString"}"   # -> for all string that got the pattern

exit 0