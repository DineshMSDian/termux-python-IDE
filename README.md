1. Install Termux

Recommended source: F-Droid (latest & maintained). Install Termux app.

Optional companion: Termux**:API** if you want device integrations.

2. Update Termux & Install Git

``` pkg update -y && pkg upgrade -y
    pkg install -y git 
```

3. Clone This Repo

``` git clone https://github.com/DineshMSDian/termux-python-IDE.git
    cd termux-python-ide/termux 
```

4. Run Bootstrap Script

``` bash bootstrap.sh 

```

Script installs Python, Neovim, build tools, LSP support, and links the provided nvim config into ~/.config/nvim.

5. Launch Neovim & Test

``` nvim examples/hello.py 

```

Run inside Neovim with: 
``` :w | !python % 

```

Or from shell:

``` python examples/hello.py 

```

If you see output and no import errors, you're good!
