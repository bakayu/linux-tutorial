#!/bin/bash

echo "========================================="
echo "   Part 3: Permissions Challenge"
echo "========================================="
echo ""

SCRIPTS_DIR="$HOME/scripts"

if [ ! -d "$SCRIPTS_DIR" ]; then
    echo "✗ Scripts directory not found"
    echo "  Run ./setup.sh first"
    exit 1
fi

PASS=0
FAIL=0

echo "Checking script permissions..."

# Check hello.sh (should be 700)
if [ -f "$SCRIPTS_DIR/hello.sh" ]; then
    PERMS=$(stat -c '%a' "$SCRIPTS_DIR/hello.sh" 2>/dev/null || stat -f '%A' "$SCRIPTS_DIR/hello.sh" 2>/dev/null)
    if [ "$PERMS" = "700" ]; then
        echo "✓ hello.sh is executable (700)"
        ((PASS++))
    else
        echo "✗ hello.sh has wrong permissions (got $PERMS, expected 700)"
        ((FAIL++))
    fi
else
    echo "✗ hello.sh not found"
    ((FAIL++))
fi

# Check backup.sh (should be 755)
if [ -f "$SCRIPTS_DIR/backup.sh" ]; then
    PERMS=$(stat -c '%a' "$SCRIPTS_DIR/backup.sh" 2>/dev/null || stat -f '%A' "$SCRIPTS_DIR/backup.sh" 2>/dev/null)
    if [ "$PERMS" = "755" ]; then
        echo "✓ backup.sh has correct permissions (755)"
        ((PASS++))
    else
        echo "✗ backup.sh has wrong permissions (got $PERMS, expected 755)"
        ((FAIL++))
    fi
else
    echo "✗ backup.sh not found"
    ((FAIL++))
fi

# Check secret.sh (should be 600)
if [ -f "$SCRIPTS_DIR/secret.sh" ]; then
    PERMS=$(stat -c '%a' "$SCRIPTS_DIR/secret.sh" 2>/dev/null || stat -f '%A' "$SCRIPTS_DIR/secret.sh" 2>/dev/null)
    if [ "$PERMS" = "600" ]; then
        echo "✓ secret.sh has correct permissions (600)"
        ((PASS++))
    else
        echo "✗ secret.sh has wrong permissions (got $PERMS, expected 600)"
        ((FAIL++))
    fi
else
    echo "✗ secret.sh not found"
    ((FAIL++))
fi

# Check sysinfo.sh exists and is executable
if [ -f "$SCRIPTS_DIR/sysinfo.sh" ]; then
    if [ -x "$SCRIPTS_DIR/sysinfo.sh" ]; then
        echo "✓ sysinfo.sh exists and is executable"
        ((PASS++))
    else
        echo "✗ sysinfo.sh is not executable"
        ((FAIL++))
    fi
else
    echo "✗ sysinfo.sh not found"
    ((FAIL++))
fi

# Test sysinfo.sh output
if [ -x "$SCRIPTS_DIR/sysinfo.sh" ]; then
    echo ""
    echo "Testing sysinfo.sh output..."
    
    OUTPUT=$("$SCRIPTS_DIR/sysinfo.sh")
    
    if echo "$OUTPUT" | grep -q "$(date +%Y)"; then
        echo "✓ Shows date/time"
        ((PASS++))
    else
        echo "✗ Missing or incorrect date/time"
        ((FAIL++))
    fi
    
    if echo "$OUTPUT" | grep -q "$USER"; then
        echo "✓ Shows username"
        ((PASS++))
    else
        echo "✗ Missing or incorrect username"
        ((FAIL++))
    fi
    
    if echo "$OUTPUT" | grep -q "/"; then
        echo "✓ Shows current directory"
        ((PASS++))
    else
        echo "✗ Missing or incorrect directory"
        ((FAIL++))
    fi
fi

echo ""
echo "========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "========================================="

if [ $FAIL -eq 0 ]; then
    echo "Great work with permissions!"
    exit 0
else
    echo "Some checks failed. Review the requirements and try again."
    exit 1
fi