#!/bin/bash

echo "========================================="
echo "   Part 2: Log Analysis Challenge"
echo "========================================="
echo ""

ANSWERS_FILE="$HOME/answers.txt"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/sample-data/server.log"

PASS=0
FAIL=0

# Check if answers.txt exists
echo "Checking answers.txt exists..."
if [ -f "$ANSWERS_FILE" ]; then
    echo "✓ answers.txt found"
    ((PASS++))
else
    echo "✗ answers.txt not found in home directory"
    echo "  Create ~/answers.txt with your solutions"
    exit 1
fi

echo ""

# Question 1: Total requests (should be 8)
echo "Checking Question 1 (Total requests)..."
TOTAL=$(wc -l < "$LOG_FILE")
if [ "$TOTAL" -eq 8 ]; then
    echo "✓ Correct: 8 requests"
    ((PASS++))
else
    echo "✗ Expected 8 requests"
    ((FAIL++))
fi

# Question 2: 404 errors (should be 2)
echo "Checking Question 2 (404 errors)..."
ERRORS=$(grep -c "404" "$LOG_FILE")
if [ "$ERRORS" -eq 2 ]; then
    echo "✓ Correct: 2 errors"
    ((PASS++))
else
    echo "✗ Expected 2 errors"
    ((FAIL++))
fi

# Question 3: Unique IPs (should be 4)
echo "Checking Question 3 (Unique IPs)..."
UNIQUE_IPS=$(cut -d' ' -f1 "$LOG_FILE" | sort -u | wc -l)
if [ "$UNIQUE_IPS" -eq 4 ]; then
    echo "✓ Correct: 4 unique IPs"
    ((PASS++))
else
    echo "✗ Expected 4 unique IPs"
    ((FAIL++))
fi

# Question 4: Most active IP (should be 192.168.1.1 with 4 requests)
echo "Checking Question 4 (Most active IP)..."
MOST_ACTIVE=$(cut -d' ' -f1 "$LOG_FILE" | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
if [ "$MOST_ACTIVE" = "192.168.1.1" ]; then
    echo "✓ Correct: 192.168.1.1"
    ((PASS++))
else
    echo "✗ Expected 192.168.1.1"
    ((FAIL++))
fi

# Question 5: Successful requests (should be 5)
echo "Checking Question 5 (Successful requests)..."
SUCCESS=$(grep -c "200" "$LOG_FILE")
if [ "$SUCCESS" -eq 5 ]; then
    echo "✓ Correct: 5 successful requests"
    ((PASS++))
else
    echo "✗ Expected 5 successful requests"
    ((FAIL++))
fi

echo ""
echo "========================================="
echo "Results: $PASS passed, $FAIL failed"
echo "========================================="

if [ $FAIL -eq 0 ]; then
    echo "Excellent log analysis!"
    exit 0
else
    echo "Some answers are incorrect. Review the hints and try again."
    exit 1
fi