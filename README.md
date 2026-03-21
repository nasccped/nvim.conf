# Neovim config

Welcome to my neovim configuration dotfiles!

Note that this is just my **personal** configuration and it's not
intended to be replaced, improved or updated. You can also send PRs
and issues to contribute, but don't consider it a real software or
serious thing...

##  Requirements

Since it's a neovim config source based on
[Lazy](https://lazy.folke.io/) plugin manager you'll need:

- the `nvim 0.10.x` version at least...
- the `lazy.nvim` dependencies as well (can be found
  [here](https://lazy.folke.io/#%EF%B8%8F-requirements))

## Setting up

Take look at the following steps to setup this config on your
machine:

> [!WARNING]
>
> Running any of these commands can make changes (**permanently**) at
> your config, so, take car of what you running and read all the
> alerts!

1. get the git repository & cd to it:

```sh
# follow this to take the config repository at your local machine
git clone https://github.com/nasccped/neovim.conf && cd neovim.conf
```

2. run the install script:

if you're in an unix system (which provides `sh` shell), run:

```sh
chmod +x install.sh && ./install.sh
```

otherwise (Windows), run:

```cmd
./install.bat
```

> [!CAUTION]
>
> - both scripts just copy the entire curdir filetree to the actual
>   neovim config path
>   - `$HOME/.config/nvim` for unix-like
>   - `%LOCALAPPDATA%/nvim` for Windows
> - the scripts provides three different kind of flags:
>   - `--help   | -h`: prints the help panel
>   - `--force  | -f`: force `.config/nvim` overriding if it already
>     exists
> - by forcing the operation, all the old neovim data will be lost
>   (including `.git` folder)
>   - a good approach is renaming the old neovim directory to a
>     backup name (like `mv ~/.config/nvim ~/.config/nvim.bak`)
> - all the operation/other flags will be ignored when calling
>   `--help` or `-h`
> - I'm not a pro at `sh` and `bat` scripting. Sorry if something
>   doesn't works as it should (you can open an issue if it's a very
>   important update :^D)
