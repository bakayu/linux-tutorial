#!/bin/bash

echo "========================================="
echo "   Part 4: Environment Challenge"
echo "========================================="
echo ""

PASS=0
FAIL=0

# Determine which shell config file to check
if [ -f "$HOME/.zshrc" ]; then
    CONFIG_FILE="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [ -f "$HOME/.bashrc" ]; then
    CONFIG_FILE="$HOME/.bashrc"
    SHELL_NAME="bash"
else
    echo "✗ No shell configuration file found"
    exit 1
fi

echo "Checking shell configuration file..."
echo "✓ Found .$SHELL_NAME" "rc"
((PASS++))

echo ""
echo "Checking for required aliases..."

# Check for aliases
ALIASES=("ll" "gs" "gp" "dev" "reload")

for alias_name in "${ALIASES[@]}"; do
    if grep -q "alias $alias_name=" "$CONFIG_FILE"; then
        echo "✓ Alias '$alias_name' found"
        ((PASS++))
    else
        echo "✗ Alias '$alias_name' not found"
        ((FAIL++))
    fi
done

echo ""
echo "Checking for mkcd function..."

if grep -q "mkcd()" "$CONFIG_FILE" || grep -q "function mkcd" "$CONFIG_FILE"; then
    echo "✓ Function 'mkcd' found"
    ((PASS++))
else
    echo "✗ Function 'mkcd' not found"
    ((FAIL++))
fi

echo ""
echo "Testing aliases..."

# Source the config file to test
source "$CONFIG_FILE"

# Test ll alias
if alias ll &>/dev/null && alias ll | grep -q "ls -lah"; then
    echo "✓ 'll' works correctly"
    ((PASS++))
else
    echo "✗ 'll' not configured correctly"
    ((FAIL++))
fi

# Test dev alias
if alias dev &>/dev/null; then
    echo "✓ 'dev' alias exists"
    ((PASS++))
else
    echo "✗ 'dev' not configured"
    ((FAIL++))
fi

echo ""
echo "Testing mkcd function..."

# Test mkcd function
TEST_DIR="$HOME/mkcd-test-$$"
if declare -f mkcd > /dev/null; then
    mkcd "$TEST_DIR" &>/dev/null
    if [ "$PWD" = "$TEST_DIR" ] && [ -d "$TEST_DIR" ]; then
        echo "✓ mkcd creates and enters directory"
        ((PASS++))
        cd ..
        rm -rf "$TEST_DIR"
    else
        echo "✗ mkcd doesn't work correctly"
        ((FAIL++))
    fi
else
    echo "✗ mkcd function not found"
    ((FAIL++))
fi

echo ""
echo "========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "========================================="

if [ $FAIL -eq 0 ]; then
    echo "Excellent shell customization!"
    exit 0
else
    echo "Some checks failed. Review the requirements and try again."
    exit 1
fi