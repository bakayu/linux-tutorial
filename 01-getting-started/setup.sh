#!/bin/bash

echo "Setting up Part 1 challenge environment..."
echo ""

# Clean up any existing challenge directory
if [ -d "$HOME/workshop-challenges/web-project" ]; then
    echo "Removing existing challenge directory..."
    rm -rf "$HOME/workshop-challenges/web-project"
fi

echo "Challenge environment ready!"
echo ""
echo "Instructions:"
echo "1. Read the challenge in README.md"
echo "2. Create the project structure"
echo "3. Run ./verify.sh to check your work"