#!/bin/bash

echo "========================================="
echo "   Part 0: Environment Verification"
echo "========================================="
echo ""

PASS=0
FAIL=0

# Check if running in terminal
if [ -t 0 ]; then
    echo "✓ Running in a terminal"
    ((PASS++))
else
    echo "✗ Not running in a terminal"
    ((FAIL++))
fi

# Check basic commands
for cmd in pwd ls echo whoami; do
    if command -v $cmd &> /dev/null; then
        echo "✓ Command '$cmd' works"
        ((PASS++))
    else
        echo "✗ Command '$cmd' not found"
        ((FAIL++))
    fi
done

# Check package manager
if command -v apt &> /dev/null; then
    echo "✓ Package manager: apt"
    ((PASS++))
elif command -v brew &> /dev/null; then
    echo "✓ Package manager: brew"
    ((PASS++))
elif command -v dnf &> /dev/null; then
    echo "✓ Package manager: dnf"
    ((PASS++))
elif command -v pacman &> /dev/null; then
    echo "✓ Package manager: pacman"
    ((PASS++))
else
    echo "✗ No supported package manager found"
    ((FAIL++))
fi

# Check essential tools
for tool in git curl; do
    if command -v $tool &> /dev/null; then
        echo "✓ Tool '$tool' installed"
        ((PASS++))
    else
        echo "✗ Tool '$tool' not installed"
        ((FAIL++))
    fi
done

# Check editor
if command -v vim &> /dev/null || command -v nano &> /dev/null; then
    echo "✓ Text editor available"
    ((PASS++))
else
    echo "✗ No text editor found (vim or nano)"
    ((FAIL++))
fi

# Check neofetch
if command -v neofetch &> /dev/null; then
    echo "✓ neofetch installed"
    ((PASS++))
else
    echo "✗ neofetch not installed"
    ((FAIL++))
fi

echo ""
echo "========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "========================================="

if [ $FAIL -eq 0 ]; then
    echo "All checks passed! You're ready for the workshop!"
    exit 0
else
    echo "Some checks failed. Please review the setup guide."
    exit 1
fi