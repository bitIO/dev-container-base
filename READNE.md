# Dev Container Base

A dev container to be used as base. It's not light and is meant to be used as a
testing artifact.

It's build on top of `mcr.microsoft.com/devcontainers/base:jammy` which provides
the basic tooling for a development environment. More details can be found in
[here](https://github.com/devcontainers/images/tree/main/src/base-debian)

It also comes with (and just to make it look pretty):

- oh-my-zsh
  - powerlevel10k
  - zsh-autosuggestions
  - zsh-completions
  - zsh-history-substring-search
  - zsh-syntax-highlighting
- zinit
- fzf
  - fzf-tab
- zoxide
- bat ( a cat replacement )
