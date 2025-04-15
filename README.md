oo# 🧠 HPC Dotfiles Manager

`hpc-dotfiles` is a personal dotfile management system built to track and sync important configuration files like `.zshrc`, `.vimrc`, `.gitconfig`, etc., across multiple systems using Git and symbolic links.

This tool provides a clean, reproducible, and safe way to store, version, and restore your environment.

---

## 💻 Features

- 🔗 Symlink config files into place
- 📦 Automatically back up originals
- 💾 Track all managed files in `dotfiles.json`
- 🔁 Restore environment with one command
- 🧹 Cleanly remove managed files

---

## 📁 Project Structure

```
~/hpc-dotfiles/
├── zshrc                  # Actual dotfile under version control
├── dotfiles.json          # Tracks all managed dotfiles
└── scripts/
    └── hpc                # CLI for managing your dotfiles
```

---

## 🚀 Usage Instructions

### 🟢 Add a New Dotfile

```bash
hpc add ~/.zshrc
```

- Moves `.zshrc` into `~/hpc-dotfiles/zshrc`
- Creates a symlink at `~/.zshrc`
- Updates `dotfiles.json`
- Commits the change

---

### 🔄 Restore All Dotfiles (on any system)

```bash
hpc restore
```

- Rebuilds all symlinks based on `dotfiles.json`

---

### 📋 List All Managed Dotfiles

```bash
hpc list
```

---

### ❌ Remove a Dotfile from Management

```bash
hpc remove ~/.zshrc
```

- Removes the symlink
- Restores original file (if backed up)
- Updates `dotfiles.json`
- Deletes from repo (if configured)

---

## ⚙️ Setup

```bash
git clone git@github.com:yourusername/hpc-dotfiles.git ~/hpc-dotfiles
cd ~/hpc-dotfiles
./scripts/hpc restore
```

You can add `~/hpc-dotfiles/scripts/` to your `$PATH` or add an alias:

```bash
alias hpc="~/hpc-dotfiles/scripts/hpc"
```

---

## 📌 Example Workflow

```bash
hpc add ~/.zshrc
hpc add ~/.gitconfig
hpc list
hpc restore
```
