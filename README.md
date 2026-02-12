# installing 



## ⚡️ Quick Install

To set up your environment on a fresh Linux install, run this single command:

```bash
git clone https://github.com/R4F4I/dotfiles.git && cd dotfiles && chmod +x install.sh && ./install.sh

```

### 🛠 About `install.sh`

This interactive script automates the entire setup process:

* **Symlinks Configs:** Links `.bashrc` and other files directly to your home directory (so `git pull` updates them instantly).
* **Safe Backups:** Automatically moves your old config files to a backup folder before overwriting.
* **Package Menu:** Prompts you to install essential tools (`eza`, `gcc`, `make`, `neofetch`).
* **Dependency Handling:** Automatically adds necessary GPG keys and repositories (e.g., for `eza`) to prevent installation errors.


# using bash

## 1. Modern File Listing (`eza`)

Instead of the old-school `ls`, these aliases use `eza`, a modern replacement that adds colors and icons.

* **`ls`**: Displays files in a grid with icons and puts folders at the top.
* **`ll`**: The "Long List." Shows file sizes, permissions, and **Git status** (if you are inside a code repository).
* **`lt`**: The **Tree view**. It shows your folders like a branching map two levels deep.
* *Usage:* Just type `lt` to see the structure of your current project.



---

## 2. Intelligent History Search

This is a massive quality-of-life upgrade for your arrow keys.

* **How to use it:** Type the first few letters of a command you used recently (e.g., `ssh` or `docker`) and then **press the Up Arrow**.
* **What happens:** Instead of cycling through every single command you've ever typed, it will *only* show previous commands that started with those specific letters.

---

## 3. Desktop Alerts

The `alert` alias is designed for commands that take a long time to finish (like a big download or a code compile).

* **Usage:** `sleep 10; alert`
* **Result:** After 10 seconds, a notification bubble will pop up on your Linux desktop telling you the command is finished. It even uses a different icon if the command failed!

---

## 4. Automatic Session Recording

This script is "set it and forget it." Every time you open your terminal, it silently starts recording everything you type and every output you see.

* **Where are the files?** They are saved in `~/.terminal_logs/`.
* **Why is this useful?** If you did something complex three days ago and forgot how you did it, you can go back and look at the "tape."
* **Note:** If the folder `~/.terminal_logs` doesn't exist, the recording might fail. You should create it once using `mkdir -p ~/.terminal_logs`.

---

## 5. Clean Log Reading

Terminal logs (from the `script` command) often contain "junk" characters like `^M` or beep codes that make them hard to read in a normal text editor.

* **Usage:** `readlog ~/.terminal_logs/your-log-file.log`
* **Result:** It cleans up the "noise" and opens the log in a readable format inside `less` (press **Q** to quit).

---

## 6. Enhanced Clock Prompt

Your prompt has been modified to show the time.

* **Format:** `[HH:MM:SS] username: path$ `
* **Benefit:** This helps you track exactly when you executed a command without having to run `date` constantly.

---
