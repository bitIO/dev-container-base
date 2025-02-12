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

## Shared SSH keys

Container shares the local SSH directory by mounting it this way:
```json
  "mounts": [
    "source=${localEnv:HOME}/.ssh,target=/home/vscode/.ssh,type=bind,consistency=cached"
  ]
```

This prevents the possible errors when acessing git repositories

## Shared VSCode configuration

Included extensions:

- ms-azuretools.vscode-docker
- streetsidesoftware.code-spell-checker-cspell-bundled-dictionaries
- oderwat.indent-rainbow
- shardulm94.trailing-spaces
- wmaurer.change-case

Included configuration:

```json
{
  "editor.fontFamily": "'FiraCode NF', 'FiraCode Nerd Font',  Menlo, Monaco, 'Courier New', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 12,
  "editor.fontWeight": "400",
  "editor.formatOnPaste": false,
  "editor.formatOnSave": true,
  "editor.formatOnSaveMode": "file",
  "editor.guides.bracketPairs": true,
  "editor.guides.highlightActiveIndentation": true,
  "editor.guides.indentation": true,
  "editor.inlineSuggest.enabled": true,
  "editor.letterSpacing": 0.5,
  "editor.minimap.enabled": false,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.quickSuggestionsDelay": 30,
  "editor.rulers": [
    {
      "color": "#fff23866",
      "column": 80
    },
    {
      "color": "#ffc03866",
      "column": 100
    },
    {
      "color": "#d6040466",
      "column": 120
    }
  ],
  "editor.snippetSuggestions": "inline",
  "editor.stickyScroll.enabled": true,
  "editor.suggest.preview": true,
  "editor.suggestSelection": "first",
  "editor.tabSize": 2,
  "editor.wordWrap": "on",
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.defaultProfile.linux": "zsh",
  "terminal.integrated.copyOnSelection": true,
  "terminal.integrated.fontFamily": "MesloLGS NF",
  "terminal.integrated.fontSize": 12,
  "terminal.integrated.scrollback": 2000,
  "vsicons.dontShowNewVersionMessage": true,
  "window.confirmBeforeClose": "keyboardOnly",
  "window.title": "${dirty} ${activeEditorMedium}${separator}${rootName}"
}
```