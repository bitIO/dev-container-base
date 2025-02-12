FROM mcr.microsoft.com/devcontainers/base:jammy

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends bat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home/vscode

RUN mkdir -p .local/share/zinit/zinit.git && \
    git clone https://github.com/zdharma-continuum/zinit.git .local/share/zinit/zinit.git

RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k

RUN git clone --depth 1 https://github.com/junegunn/fzf.git .fzf && \
    .fzf/install --all

RUN mkdir -p .local/bin && \
    mkdir -p .local/man
RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh -o /tmp/zoxide.install.sh
RUN sh /tmp/zoxide.install.sh --bin-dir=/home/vscode/.local/bin --man-dir=/home/vscode/.local/man > debug.log 2>&1

COPY ./local/.zshrc /home/vscode/.zshrc
COPY ./local/.fzf.zsh /home/vscode/.fzf.zsh
COPY ./local/.p10k.zsh /home/vscode/.p10k.zsh

RUN chown -R vscode:vscode /home/vscode/.local && \
    chown -R vscode:vscode /home/vscode/.oh-my-zsh && \
    chown -R vscode:vscode /home/vscode/.fzf && \
    chown vscode:vscode /home/vscode/.zshrc && \
    chown vscode:vscode /home/vscode/.fzf.zsh && \
    chown vscode:vscode /home/vscode/.p10k.zsh