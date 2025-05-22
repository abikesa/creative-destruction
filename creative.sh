#!/bin/bash

echo "🌱 Rebuilding Ukubona Dev Environment..."

# === XCODE CLI TOOLS ===
echo "🔧 Installing Xcode CLI Tools..."
xcode-select --install 2>/dev/null || echo "✔️ Already installed"

# === INSTALL HOMEBREW ===
if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✔️ Homebrew already installed"
fi

# === INSTALL CORE TOOLS ===
echo "🔨 Installing Git, Python via pyenv, Node, VSCode..."
brew install git pyenv node
brew install --cask visual-studio-code

# === PYENV SETUP ===
PYTHON_VERSION="3.11.9"
echo "🐍 Installing Python $PYTHON_VERSION via pyenv..."
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# === VERIFY ENVIRONMENT ===
echo "🧪 Verifying tools..."
git --version
python --version
node --version
code --version

# === CREATE CLEAN WORKSPACE ===
mkdir -p ~/code
cd ~/code
echo "📁 Created ~/code for fresh clones"

# === OPTIONAL: Auto-clone Ukubona starter repo ===
# git clone https://github.com/yourorg/ukubona.git

echo "✅ Creative environment ready. Go forth and teach!"
