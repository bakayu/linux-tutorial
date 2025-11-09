# Part 4: Environment Customization

Practice customizing your shell environment.

## Challenge: Create Your Development Aliases

Add useful aliases to your shell configuration file.

## Instructions

1. Open your shell configuration file:
   - Bash users: `~/.bashrc`
   - Zsh users: `~/.zshrc`

2. Add these aliases at the end of the file:
   ```bash
   alias ll='ls -lah'
   alias gs='git status'
   alias gp='git pull'
   alias dev='cd ~/workshop-challenges'
   alias reload='source ~/.bashrc'  # or ~/.zshrc for zsh users
   ```

3. Add a custom function that creates a directory and moves into it:
   ```bash
   mkcd() {
       mkdir -p "$1" && cd "$1"
   }
   ```

4. Reload your configuration:
   ```bash
   source ~/.bashrc  # or source ~/.zshrc
   ```

5. Test your aliases:
   - Run `ll` in your home directory
   - Run `dev` to go to workshop-challenges
   - Run `mkcd test-folder` to create and enter a new directory

## Verification

```bash
cd 04-environment-customization
chmod +x verify.sh
./verify.sh
```

## Expected Output

```
=========================================
   Part 4: Environment Challenge
=========================================

Checking shell configuration file...
✓ Found .bashrc

Checking for required aliases...
✓ Alias 'll' found
✓ Alias 'gs' found
✓ Alias 'gp' found
✓ Alias 'dev' found
✓ Alias 'reload' found

Checking for mkcd function...
✓ Function 'mkcd' found

Testing aliases...
✓ 'll' works correctly
✓ 'dev' changes to correct directory

Testing mkcd function...
✓ mkcd creates and enters directory

=========================================
Results: 10 passed, 0 failed
=========================================
Excellent shell customization!
```

## Hints

<details>
<summary>Hint 1: Opening the config file</summary>

```bash
# Using nano
nano ~/.bashrc

# Using vim
vim ~/.bashrc

# Or any editor you prefer
```

</details>

<details>
<summary>Hint 2: Adding to the end of file</summary>

Scroll to the bottom of the file and add your aliases there.
In nano: Use arrow keys to navigate
In vim: Press 'G' to go to end, 'i' to insert

</details>

<details>
<summary>Hint 3: Saving and exiting</summary>

nano: Ctrl+O to save, Ctrl+X to exit
vim: Press Esc, type :wq and press Enter

</details>

<details>
<summary>Hint 4: Applying changes</summary>

After editing, reload your config:
```bash
source ~/.bashrc
```

Or open a new terminal window.

</details>

<details>
<summary>Hint 5: Testing aliases</summary>

```bash
# Test each alias
ll
gs
dev
cd ~

# Test the function
mkcd my-test-dir
pwd  # Should show you're in my-test-dir
```

</details>

## What You're Learning

- Customizing shell environment
- Creating command shortcuts (aliases)
- Writing shell functions
- Reloading configuration
- Making your workflow more efficient

## Commands You'll Need

- nano or vim
- source
- alias
- function definition

## Time Goal

Try to complete this in under 10 minutes!

## Bonus

Add these additional useful aliases:
```bash
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
alias c='clear'
```

## Next Steps

Congratulations! You've completed the core workshop challenges.

Continue practicing these skills:
- Create more custom aliases for your workflow
- Explore oh-my-zsh or oh-my-bash for advanced customization
- Learn about environment variables
- Try the OverTheWire Bandit challenges for more practice