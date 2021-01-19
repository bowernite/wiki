# Shell Scripting

Notes on shell scripting, as well as some zsh- and bash-specific stuff.

## Notes

- zsh has two representations for array variables like PATH and CDPATH, of which the lower case variant is an actual array
- `~` is a special character. Therefore, if you use it in a string variable and then try to do something with it, `~` will be evaluated literally, and not expanded to the value of $HOME. So **use $HOME** in these cases instead
- Functions can be declared with/without `function` keyword and parens
  - `my_function ()`, `function my_function`, etc
- To pass arguments to a function, just use spaces
  - `my_function "hello" "world"`
  - If passing variables, sometimes it's good practice to put them in quotes in case the variables have spaces in them
- The `export` keyword is only necessary when sub-processes need access to the variable
  - So if you don't use `export`, when you execute programs they won't have access to the variable. But **the resulting shell will**
- To do string transformation on strings in zsh upon expansion, use [expansion flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags)
- To rename the current directory: `mv ../current_dir ../new_dir_name` or `mv ../{test,test2}` \(uses brace expansion for brevity\)
- [Assigning test/[[]] results to a variable](https://stackoverflow.com/questions/24896433/assigning-the-result-of-test-to-a-variable) (tl;dr: there's not a great way to do this). This _would_ be nice for code readability

## Links

- [Lowercasing and Uppercasing strings in bash/zsh](https://scriptingosx.com/2019/12/upper-or-lower-casing-strings-in-bash-and-zsh/)
- [Bash scripting cheatsheet](https://devhints.io/bash)
