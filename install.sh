touch ~/coolbro

# Create VSCode settings directory if it doesn't exist
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS path
  VSCODE_SETTINGS_DIR="${userHome}/Library/Application Support/Code/User"
else
  # Linux path
  VSCODE_SETTINGS_DIR="${userHome}/.config/Code/User"
fi
echo "foo"
echo "$VSCODE_SETTINGS_DIR"

# Create the directory if it doesn't exist
mkdir -p "${VSCODE_SETTINGS_DIR}"

# Copy the settings file
cp -i vscode/settings.json "${VSCODE_SETTINGS_DIR}/"

echo "_________________________________"

wget https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_linux_amd64.zip && \
  unzip kubelogin_linux_amd64.zip kubelogin && \ 
  sudo mv kubelogin /usr/local/bin/kubectl-oidc_login &&  \
  rm kubelogin_linux_amd64.zip

zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions /home/node/.oh-my-zsh/custom/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/node/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
# cp ./.zshrc ~

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/node/.oh-my-zsh/custom/themes/powerlevel10k

# update plugins & theme of oh my zsh
sed -i '/^ZSH_THEME/c\ZSH_THEME="powerlevel10k/powerlevel10k"' /home/node/.zshrc
sed -i '/^plugins/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)' /home/node/.zshrc

ln -s /any/file/on/the/disk linked-file

CMD='export HISTFILE="./.devcontainer/history/.zsh_history"'
echo "$CMD" >> /home/node/.zshrc
