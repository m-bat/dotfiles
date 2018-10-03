#!/bin/sh

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    openssl
    reattach-to-user-namespace
    "--without-etcdir zsh"
    zsh-completions
    emacs
    cask
    ansible
    python3
    markdown
    ctags
    ssh-copy-id
    tmux
)


echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    iterm2
    virtualbox
    vagrant
    vagrant-manager
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
