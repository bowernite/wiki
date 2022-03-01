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
- To rename the current directory: `mv ../current_dir ../new_dir_name` or `mv ../{test,test2}` (uses brace expansion for brevity)
- [Assigning test/[[]] results to a variable](https://stackoverflow.com/questions/24896433/assigning-the-result-of-test-to-a-variable) (tl;dr: there's not a great way to do this). This _would_ be nice for code readability
- Can't assign variable to command exit status directly
  - But can get around it using `$?`:
    - `(grep foo bar.txt); var1=$?`
  - [bash - Assigning exit code to a shell local variable - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/207957/assigning-exit-code-to-a-shell-local-variable)
- [macOS has a weird quirk where filenames with a `:` show a `/` for them instead](https://stackoverflow.com/questions/13298434/colon-appears-as-forward-slash-when-creating-file-name)
  - Can get around this if you need to by using this guy instead: `꞉` -- it's a different character but looks pretty similar
- For conditionals, 0 is truthy and 1 is falsey
- For **multline string usage**, use [HereDoc](https://linuxize.com/post/bash-heredoc/)
- For **stripping trailing characters**, use [parameter expansion `%`: `${var%/}`, (stripping `/`)](https://stackoverflow.com/questions/9018723/what-is-the-simplest-way-to-remove-a-trailing-slash-from-each-parameter)

## Links

- [Lowercasing and Uppercasing strings in bash/zsh](https://scriptingosx.com/2019/12/upper-or-lower-casing-strings-in-bash-and-zsh/)
- [Bash scripting cheatsheet](https://devhints.io/bash)
- [Assigning default values to shell variables with a single command in bash - Stack Overflow](https://stackoverflow.com/questions/2013547/assigning-default-values-to-shell-variables-with-a-single-command-in-bash)
- [zsh - string substitutions: all occurrences - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/115438/string-substitutions-all-occurrences)
- [A Quick Primer on Bash Booleans (StackOverflow)](https://stackoverflow.com/questions/19670061/bash-if-false-returns-true-instead-of-false-why)
- [bash - How to change the output color of echo in Linux - Stack Overflow](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)
- [How to exit bash function if error? - Stack Overflow](https://stackoverflow.com/questions/40429865/how-to-exit-bash-function-if-error)
- [Shell Tools and Scripting · the missing semester of your cs education](https://missing.csail.mit.edu/2020/shell-tools/)
