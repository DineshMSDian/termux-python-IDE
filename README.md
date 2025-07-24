## Getting Started

urn your Android phone into a pocket Python development machine using `Termux + Neovim`. This guide is written for complete beginners, walking you step by step from  installing Termux to writing and running Python code with LSP (language server) support, helpful keybindings, and optional customizations.
## Why This Repo?

 I wasted a whole week thinking I needed a laptop to learn Python. Then I discovered Termux  a Linux terminal on Android and built my own Python IDE with Neovim. This repo is my complete beginner-friendly setup so you can do the same without the struggle.

### Prerequisites

* Android phone (Android 8+ recommended).

* At least 1GB free storage.

* Willingness to type a few commands.

(No root or advanced Linux skills required!)

## Quick Start 

1. Install Termux (from F-Droid)

Recommended source: F-Droid (latest & maintained).
Install Termux app.


Link: https://f-droid.org/en/packages/com.termux/    
Optional companion: `Termux API` if you want device integrations.

* Open Termux

2. Update Termux & Install Git

``` 
    pkg update -y && pkg upgrade -y
    pkg install -y git 
```

3. Clone This Repo

``` 
    git clone https://github.com/DineshMSDian/termux-python-IDE.git
    
    cd termux-python-ide/termux 
```

4. Run the Setup Script

```sh 
   bash bootstrap.sh 
```

* This script will:

* Install Python, pip, Neovim

* Install pynvim, black, ruff, pyright

* Configure Neovim with init.lua and LSP support, and links the provided nvim config into ` ~/.config/nvim `

5. Launch Neovim & Test

```sh 
   nvim examples/hello.py 
```

Run inside Neovim with: 
```sh 
   :w | !python % 
```

Or from shell:

```sh 
   python examples/hello.py 
```

If you see output and no import errors, you're good!

## Key Features

### Key Bindings

`<Space>r` – Run the current Python file.

`<Space>f` – Format code using Black.

`<Space>l` – Lint code using Ruff.

`<Space>w`– Save file.

`<Space>q` – Quit Neovim.

(Tip: Space bar is your leader key – easy to press on mobile keyboards.)

### LSP Features

* Auto-completion and code hints.

* On-the-fly linting and type checking.

* Quick navigation to definitions and references

## Optional Features & customizations

### 1. Zsh & Oh-My-Zsh

Want a colorful and smart shell?

```
pkg install -y zsh
chsh -s zsh
```

Then install Oh-My-Zsh with:

```sh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 2. Themes & Icons

Use plugins like `lualine.nvim` or `tokyonight.nvim` (already configured in plugins.lua).

`Will update more`
## Contributing

 New to coding? Share your keyboard mapping ideas, bug reports, or plugin suggestions by opening an issue.
