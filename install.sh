wget https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_linux_amd64.zip && \
  unzip kubelogin_linux_amd64.zip kubelogin && \ 
  sudo mv kubelogin /usr/local/bin/kubectl-oidc_login &&  \
  rm kubelogin_linux_amd64.zip

zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

sed -i '/^ZSH_THEME/c\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc
sed -i '/^plugins/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)' ~/.zshrc

cp ~/dotfiles/.p10k.zsh ~/.p10k.zsh
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc


echo "[include]" >> ~/.gitconfig
echo "        path = ~/dotfiles/.gitconfig" >> ~/.gitconfig