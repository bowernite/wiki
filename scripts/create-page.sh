#!/bin/zsh

################################################################################
# WIP: Create a new wiki page
#
# Arguments:
#   $1: directory: Directory to put the new page
#   $2: page_title: The title of the wiki page. No capitilzation transformations done
################################################################################

directory=$1
page_title=$2
if [[ -z $directory || -z $page_title ]]; then
  echo "Error: You must provide a directory and a page title as the first two arguments" >/dev/stderr
  exit 1
fi

# Construct the filename from the page_title
## lowercase
filename=${page_title:l}
## kebab-case
filename=${filename// /-}
## .md extension
filename=${filename}.md

# TODO: Read this: https://linuxize.com/post/bash-heredoc/
cat <<EOF >"$directory/$filename"
# $page_title

## Notes

## Links
EOF

#####################################################################
# Practice
#
# Practice scripts, as I learned the utilities I needed for this script
#####################################################################

exit

echo "Printing the whole line"
awk '{print $0}' public/SUMMARY.md
echo

echo "Printing the second word for each column"
awk '{print $2}' public/SUMMARY.md
echo

echo "Printing all lines matching 'Health'"
# Note: GNU awk / gawk seems to be case-sensitive by default. So this should only get us the header
awk '/Health/{print}' public/SUMMARY.md
echo

echo "Printing all lines for Craft (example that doesn't have a md file for a directory)"
# Note: GNU awk / gawk seems to be case-sensitive by default. So this should only get us the header
awk '/Craft/{print}' public/SUMMARY.md
echo

# Now that I think about it, we'll probably be accepting a path as an argument
## i.e. `public/craft`
## or, `public`, if path was omitted (default to no directory)
# So, let's match a path like that
echo "Printing the line for 'public/well-being/health' root list item"
path="well-being"
awk -v path=$path '/path/{print}' public/SUMMARY.md

# NEXT TIME:
## Need to figure out how we're going to match regular expressions with a variable (in our case, a $path)
## Need to figure out how to handle those when the variable has a slash (ours will, since it's a path)
## Need to figure out how to handle converting that path into the title -- i.e. the `Craft` header has no markdown file -- it's just a blank header -- so it won't have the path in it
