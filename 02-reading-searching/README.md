# Part 2: Reading & Searching

Practice text processing and log analysis.

## Challenge: Web Server Log Analysis

Analyze web server logs to extract useful information.

## Setup

Run the setup script to create sample log files:

```bash
cd 02-reading-searching
chmod +x setup.sh
./setup.sh
```

This creates `sample-data/server.log` with web server access logs.

## Instructions

Analyze `sample-data/server.log` and answer these questions by creating commands:

1. How many total requests are in the log?
2. How many requests returned a 404 error?
3. List all unique IP addresses that made requests
4. Which IP address made the most requests?
5. Show only successful requests (HTTP 200)

Create a file called `answers.txt` in your home directory with your commands and their outputs.

## Example Format for answers.txt

```
Question 1: Total requests
Command: wc -l sample-data/server.log
Output: 8 sample-data/server.log

Question 2: 404 errors
Command: grep "404" sample-data/server.log | wc -l
Output: 2

...continue for all questions
```

## Verification

```bash
chmod +x verify.sh
./verify.sh
```

## Expected Output

```
=========================================
   Part 2: Log Analysis Challenge
=========================================

Checking answers.txt exists...
✓ answers.txt found

Checking Question 1 (Total requests)...
✓ Correct: 8 requests

Checking Question 2 (404 errors)...
✓ Correct: 2 errors

Checking Question 3 (Unique IPs)...
✓ Correct: 4 unique IPs

Checking Question 4 (Most active IP)...
✓ Correct: 192.168.1.1

Checking Question 5 (Successful requests)...
✓ Correct: 4 successful requests

=========================================
Results: 5 passed, 0 failed
=========================================
Excellent log analysis!
```

## Hints

<details>
<summary>Hint 1: Counting lines</summary>

Use `wc -l filename` to count lines.

</details>

<details>
<summary>Hint 2: Searching for patterns</summary>

Use `grep "pattern" filename` to find lines matching a pattern.
Combine with `wc -l` to count matches.

</details>

<details>
<summary>Hint 3: Extracting columns</summary>

Use `cut -d' ' -f1 filename` to extract the first column (space-delimited).
The IP address is the first column in the log.

</details>

<details>
<summary>Hint 4: Unique values</summary>

Use `sort | uniq` to get unique values.
Example: `cut -d' ' -f1 file | sort | uniq`

</details>

<details>
<summary>Hint 5: Counting occurrences</summary>

Use `sort | uniq -c` to count occurrences.
Then `sort -rn` to sort numerically in reverse.

</details>

## Commands You'll Need

- grep
- wc
- cut
- sort
- uniq
- pipes (|)

## Time Goal

Try to complete this in under 10 minutes!

## Next

Proceed to Part 3: Permissions & Processes
