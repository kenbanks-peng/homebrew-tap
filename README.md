# Custom Homebrew Tap

Homebrew packages for rex-statusline and Monaspace variable fonts.

## Install

```sh
brew tap kenbanks-peng/tap
brew install rex-statusline
brew install --cask font-monaspace-variable
```

rex-statusline installs prebuilt GitHub release binaries for macOS and Linux
(ARM64 or x86-64), with Oh My Posh as a dependency.
Install [Rex](https://www.superlogical.com/rex/docs) separately and ensure
`rex` is on your PATH.

## Use rex-statusline

Add `eval "$(rex-statusline init zsh)"` to `~/.zshrc`, or
`eval "$(rex-statusline init bash)"` to `~/.bashrc`, then restart your shell.

```sh
rex-statusline add     # Start status lines and enable login startup
rex-statusline remove  # Stop status lines; leave login startup enabled
```

## Uninstall

Stop status lines before uninstalling:

```sh
rex-statusline remove
brew uninstall rex-statusline
brew uninstall --cask font-monaspace-variable
```
