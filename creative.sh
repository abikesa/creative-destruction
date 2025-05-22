#!/bin/bash

echo "🌱 Rebuilding Ukubona Dev Environment..."

# === CHECK XCODE ===
if ! xcode-select -p &>/dev/null; then
  echo "❌ Install Xcode CLI: xcode-select --install"
  exit 1
fi

# === INSTALL HOMEBREW ===
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# === VERIFY HOMEBREW ===
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew failed"
  exit 1
fi

# === INSTALL TOOLS ===
echo "🔨 Installing Git, pyenv, Node, VSCode..."
brew install git pyenv node xz
brew install --cask visual-studio-code

# === PYTHON SETUP ===
PYTHON_VERSION="3.11.9"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

env PATH="$(brew --prefix xz)/bin:$PATH" \
    LDFLAGS="-L$(brew --prefix xz)/lib" \
    CPPFLAGS="-I$(brew --prefix xz)/include" \
    pyenv install $PYTHON_VERSION --skip-existing

pyenv global $PYTHON_VERSION

# === SHELL CONFIG ===
grep -q 'brew shellenv' ~/.zprofile || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
grep -q 'PYENV_ROOT' ~/.zprofile || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
grep -q 'pyenv init --path' ~/.zprofile || echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
grep -q 'pyenv init -' ~/.zshrc || echo 'eval "$(pyenv init -)"' >> ~/.zshrc
grep -q 'pyenv virtualenv-init' ~/.zshrc || echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# === VERIFY ===
echo "🧪 Verifying tools..."
echo -n "Git: "; git --version
echo -n "Python: "; python --version
echo -n "Node: "; node --version
echo -n "VSCode: "; code --version

# === WORKSPACE ===
mkdir -p "$HOME/code"
cd "$HOME/code"
echo "📁 Created ~/code for fresh clones"

echo "✅ Creative environment ready. Go forth and teach!"
