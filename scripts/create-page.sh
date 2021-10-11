#!/bin/zsh

################################################################################
# WIP: Create a new wiki page
#
# Arguments:
#   $1: directory: Directory to put the new page. Can either include or exclude trailing slash
#   $2: page_title: The title of the wiki page. No capitilzation transformations done
################################################################################

set -e

root="$1"
page_title="$2"
if [[ -z $root || -z $page_title ]]; then
  echo "Error: You must provide a root and a page title as the first two arguments" >/dev/stderr
  exit 1
fi

# Construct the filename from the page_title
## lowercase
filename="${page_title:l}"
## kebab-case
filename="${filename// /-}"
## .md extension
filename="${filename}.md"

# If given a file as the root, convert it to a parent/directory
if [[ $root == *\.md ]]; then
  # Make a directory for the given root, without the .md
  original_md_file="$root"
  directory="${root%.md}"
  mkdir "$directory"

  # Move the .md file into the new directory
  original_md_filename=$(basename $original_md_file)
  mv "$original_md_file" "$directory/$original_md_filename"
else
  directory="$root"
  
  # If we don't have a directory yet, that means we're intending to make a new one
  if [[ ! -d "$directory" ]]; then
    mkdir "$directory"
  fi
fi

# Strip the trailing `/` from the directory, so we know we definitely need to add one
directory="${directory%/}"

file_path="$directory/$filename"

# This is a "HereDoc". https://linuxize.com/post/bash-heredoc/
cat <<EOF >"$file_path"
# $page_title

## Notes

## Links
EOF

# TODO: Add file to `SUMMARY.md`
# For now, just copy the markdown link to the clipboard as a quick solution
## Strip `public/` from the start of the path, since SUMMARY.md doesn't have that part of our filesystem
public_file_path="${file_path#public/}"

# Based on the depth of the file, construct the indentation to prepend to the copied link / list item
## For now not doing this -- couldn't figure out how to make the copied value be treated 'linewise' when pasting in Vim. So we'll just open a new line and paste the unindented list item
# leader="${public_file_path//[^\/]}"
# leader="${leader//\//  }"
# leader="$leader\r"
# echo "${leader}- [$page_title]($public_file_path)" | pbcopy

echo "- [$page_title]($public_file_path)" | pbcopy
echo "✅ Remember to adjust SUMMARY.md"

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
