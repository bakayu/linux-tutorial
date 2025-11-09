#!/bin/bash

echo "========================================="
echo "   Part 1: Project Structure Challenge"
echo "========================================="
echo ""

PROJECT_DIR="$HOME/workshop-challenges/web-project"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "✗ Project directory not found at $PROJECT_DIR"
    echo "  Did you create it in the right location?"
    exit 1
fi

cd "$PROJECT_DIR"

PASS=0
FAIL=0

# Check directories
DIRS=(
    "src"
    "src/components"
    "src/styles"
    "public"
    "tests"
)

echo "Checking directories..."
for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "✓ $dir"
        ((PASS++))
    else
        echo "✗ $dir (missing)"
        ((FAIL++))
    fi
done

echo ""
echo "Checking files..."

FILES=(
    "src/components/Header.js"
    "src/components/Footer.js"
    "src/styles/main.css"
    "public/index.html"
    "tests/app.test.js"
    "README.md"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
        ((PASS++))
    else
        echo "✗ $file (missing)"
        ((FAIL++))
    fi
done

echo ""
echo "========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "========================================="

if [ $FAIL -eq 0 ]; then
    echo "Perfect! Challenge completed!"
    exit 0
else
    echo "Some items are missing. Review the requirements and try again."
    exit 1
fi