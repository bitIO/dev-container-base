FROM mcr.microsoft.com/devcontainers/javascript-node:22

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git-flow \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install global packages
RUN npm install -g pnpm npm-check-updates ntl turbo @nestjs/cli npkill markdownlint-cli

# Clean up
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install helpful tools
WORKDIR /home/node

# zinit
RUN mkdir -p "/home/node/.local/share/zinit/zinit.git" && \
    git clone https://github.com/zdharma-continuum/zinit.git /home/node/.local/share/zinit/zinit.git && \
    chown -R node:node .local
# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git .fzf && \
    bash .fzf/install --all

# zoxide
RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh -o /tmp/zoxide.install.sh && \
    sh /tmp/zoxide.install.sh --bin-dir=/home/node/.local/bin --man-dir=/home/node/.local/man && \
    rm -f /tmp/zoxide.install.sh

# oh-my-zsh plugins
RUN mkdir -p /home/node/.oh-my-zsh/custom/plugins && \
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/node/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/node/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Copy resources to /home/node
COPY ./home/.fzf.zsh .fzf.zsh
COPY ./home/.p10k.zsh /home/node/.p10k.zsh
COPY ./home/.zshrc /home/node/.zshrc
COPY ./home/.gitconfig /home/node/.gitconfig
COPY ./home/.gitignore_global /home/node/.gitignore_global
COPY ./home/.stCommitMsg /home/node/.stCommitMsg
COPY ./localstack/create-resources.sh /home/node/create-resources.sh
RUN chown node:node -R /home/node


# Prepare localstack resources
RUN chmod +x /home/node/create-resources.sh && \
    mkdir -p /home/node/.localstack && \
    chown node:node /home/node/.localstack

# Update the environment variables
ENV AWS_PAGER=''
ENV NTL_RUNNER=pnpm
ENV PNPM_HOME=/home/node/.local/share/pnpm
ENV PATH="/workspace/node_modules/.bin:/home/node/.fzf/bin:/home/node/.local/bin:/home/node/.local/share/pnpm:${PATH}"

# Set default shell to Zsh
SHELL ["/usr/bin/zsh", "-c"]

# Set the default user
USER node

# Expose the default port for Vite
EXPOSE 5173