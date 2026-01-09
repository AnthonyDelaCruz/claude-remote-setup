#!/bin/bash
# Find Obsidian vault location
# Usage: bash scripts/find-vault.sh
# Returns: vault path or empty if not found

VAULT_OBSIDIAN=$(find "$HOME/Documents" -name ".obsidian" -type d -maxdepth 3 2>/dev/null | head -1)

if [ -n "$VAULT_OBSIDIAN" ]; then
    dirname "$VAULT_OBSIDIAN"
else
    # Try common locations
    for dir in "$HOME/Obsidian" "$HOME/Notes" "$HOME/Documents/Notes" "$HOME/Documents/Obsidian"; do
        if [ -d "$dir/.obsidian" ]; then
            echo "$dir"
            exit 0
        fi
    done
    echo ""
fi
