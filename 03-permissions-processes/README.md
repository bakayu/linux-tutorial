# Part 3: Permissions & Processes

Practice file permissions and script execution.

## Challenge: Script Setup & Execution

Create scripts with proper permissions and learn to manage them.

## Setup

Run the setup script:

```bash
cd 03-permissions-processes
chmod +x setup.sh
./setup.sh
```

This creates a `scripts/` directory in your home folder with several script files.

## Instructions

Complete these tasks:

1. Make `hello.sh` executable (only for you)
2. Make `backup.sh` readable and executable by everyone
3. Make `secret.sh` readable and writable only by you (no execute permission)
4. Create a new script `sysinfo.sh` that displays:
   - Current date and time
   - Your username
   - Current directory
5. Make `sysinfo.sh` executable and run it

## Verification

```bash
chmod +x verify.sh
./verify.sh
```

## Expected Output

```
=========================================
   Part 3: Permissions Challenge
=========================================

Checking script permissions...
✓ hello.sh is executable (700)
✓ backup.sh has correct permissions (755)
✓ secret.sh has correct permissions (600)
✓ sysinfo.sh exists and is executable

Testing sysinfo.sh output...
✓ Shows date/time
✓ Shows username
✓ Shows current directory

=========================================
Results: 7 passed, 0 failed
=========================================
Great work with permissions!
```

## Hints

<details>
<summary>Hint 1: Making a file executable</summary>

```bash
chmod +x filename        # Executable for everyone
chmod 700 filename       # Only you can read, write, execute
chmod u+x filename       # Add execute for user only
```

</details>

<details>
<summary>Hint 2: Permission numbers</summary>

- Read = 4
- Write = 2
- Execute = 1

Add them up:
- 7 = 4+2+1 (read, write, execute)
- 6 = 4+2 (read, write)
- 5 = 4+1 (read, execute)
- 4 = read only

Three digits: owner, group, others
- 755 = owner has all (7), others have read+execute (5)
- 700 = only owner has all permissions
- 600 = only owner can read and write

</details>

<details>
<summary>Hint 3: Creating sysinfo.sh</summary>

```bash
cat > ~/scripts/sysinfo.sh << 'EOF'
#!/bin/bash
date
whoami
pwd
EOF

chmod +x ~/scripts/sysinfo.sh
```

</details>

<details>
<summary>Hint 4: Running a script</summary>

```bash
cd ~/scripts
./sysinfo.sh
```

Or with full path:
```bash
~/scripts/sysinfo.sh
```

</details>

## Commands You'll Need

- chmod
- ls -l
- cat or nano/vim
- bash

## Time Goal

Try to complete this in under 8 minutes!

## Next

Proceed to Part 4: Environment Customization
