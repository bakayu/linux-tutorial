# Part 0: Setup Verification

Verify your environment is correctly set up for the workshop.

## Challenge

Ensure all basic commands and tools are working correctly.

## Instructions

Run the verification script:

```bash
cd 00-setup
chmod +x verify.sh
./verify.sh
```

## What It Checks

- Terminal is working
- Basic commands (pwd, ls, echo, whoami)
- Package manager (apt/brew/dnf/pacman)
- Essential tools (git, curl)
- Text editor (vim or nano)
- neofetch installed

## Expected Output

```
=========================================
   Part 0: Environment Verification
=========================================

✓ Running in a terminal
✓ Command 'pwd' works
✓ Command 'ls' works
✓ Command 'echo' works
✓ Command 'whoami' works
✓ Package manager: apt
✓ Tool 'git' installed
✓ Tool 'curl' installed
✓ Text editor available
✓ neofetch installed

=========================================
Results: 10 passed, 0 failed
=========================================
All checks passed! You're ready for the workshop!
```

## Troubleshooting

If any check fails, refer back to the setup guide:
[https://ayuch.dev/blog/linux-tutorial/00-setup](https://ayuch.dev/blog/linux-tutorial/00-setup)

## Next

Proceed to Part 1: Getting Started
