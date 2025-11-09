# Part 1: Getting Started

Practice navigation and file operations.

## Challenge: Build a Project Structure

Create a complete project directory structure using only command-line tools.

## Instructions

Your goal is to create this exact structure:

```
~/workshop-challenges/web-project/
├── src/
│   ├── components/
│   │   ├── Header.js
│   │   └── Footer.js
│   └── styles/
│       └── main.css
├── public/
│   └── index.html
├── tests/
│   └── app.test.js
└── README.md
```

## Requirements

1. Start from your home directory
2. Use only: mkdir, touch, cd, ls, pwd
3. Create the exact structure shown above
4. All files should be empty

## Verification

Run the verification script:

```bash
cd 01-getting-started
chmod +x verify.sh
./verify.sh
```

## Expected Output

```
=========================================
   Part 1: Project Structure Challenge
=========================================

Checking directories...
✓ src
✓ src/components
✓ src/styles
✓ public
✓ tests

Checking files...
✓ src/components/Header.js
✓ src/components/Footer.js
✓ src/styles/main.css
✓ public/index.html
✓ tests/app.test.js
✓ README.md

=========================================
Results: 11 passed, 0 failed
=========================================
Perfect! Challenge completed!
```

## Hints

<details>
<summary>Hint 1: Creating the root directory</summary>

```bash
cd ~
mkdir -p workshop-challenges/web-project
cd workshop-challenges/web-project
```

</details>

<details>
<summary>Hint 2: Creating nested directories</summary>

Use `mkdir -p` to create parent directories automatically:

```bash
mkdir -p src/components src/styles public tests
```

</details>

<details>
<summary>Hint 3: Creating multiple files</summary>

```bash
touch src/components/Header.js src/components/Footer.js
touch src/styles/main.css
touch public/index.html
touch tests/app.test.js
touch README.md
```

</details>

## Time Goal

Try to complete this in under 5 minutes!

## Next

Proceed to Part 2: Reading & Searching
