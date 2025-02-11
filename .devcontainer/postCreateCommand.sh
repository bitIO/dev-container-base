#!/bin/sh

# Print information about the system
echo "System information:"
uname -a 
lsb_release
whoami

# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"


# # Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Override default files
cp /workspaces/dev-containers/.devcontainer/oh-my-zsh/.zshrc ~/.zshrc
cp /workspaces/dev-containers/.devcontainer/oh-my-zsh/.fzf.zsh ~/.fzf.zsh
cp /workspaces/dev-containers/.devcontainer/oh-my-zsh/.p10k.zsh ~/.p10k.zsh