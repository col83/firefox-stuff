#!/usr/bin/bash

echo
echo "This action will permanently remove Mozilla Firefox profiles and settings."
echo
echo "Directories to be removed:"
echo "  $HOME/.mozilla"
echo "  $HOME/.config/mozilla"
echo
read -r -p "Type YES to continue: " CHOICE

if [ "$CHOICE" != "YES" ]; then
echo
echo "Operation cancelled."
exit 0
fi

rm -rf "$HOME/.mozilla"
rm -rf "$HOME/.config/mozilla"