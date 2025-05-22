#!/bin/bash
set -e
trap 'echo "💥 Script failed at line $LINENO. Aborting." && exit 1' ERR

# === ONE-TIME MANUAL STEPS (DO BEFORE RUNNING THIS SCRIPT) ===
# You must install these once manually:
# 1. Xcode CLI Tools:     xcode-select --install
# 2. Homebrew:            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# After that, run this script.

# === ADMIN ACCESS ===
sudo -v || { echo "❌ Admin access required. Aborting."; exit 1; }

# === CHECK USER IS ADMIN ===
if ! groups "$USER" | grep -qE '\badmin\b'; then
  echo "⛔ User '$USER' is not an admin. This setup requires sudo privileges."
  echo "🔐 Try running as an admin user or contact your system administrator."
  exit 1
fi

echo "🌱 Rebuilding Ukubona Dev Environment..."

# === VERIFY XCODE CLI TOOLS ===
echo "🔧 Verifying Xcode CLI Tools..."
xcode-select -p &>/dev/null && echo "✔️ Xcode CLI Tools installed" || {
  echo "❌ Xcode CLI Tools not detected. Install manually: xcode-select --install"
  exit 1
}

# === VERIFY HOMEBREW ===
echo "🍺 Checking Homebrew..."
if ! command -v brew &> /dev/null; then
  echo "❌ Homebrew not found. Please install manually:"
  echo "    /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
else
  echo "✔️ Homebrew already installed"
  eval "$($(command -v brew) shellenv)"
fi

# === INSTALL CORE TOOLS ===
echo "🔨 Installing Git, pyenv, Node, VSCode, and dependencies..."
brew install git pyenv node xz
brew install --cask visual-studio-code

# === PYENV + PYTHON SETUP ===
PYTHON_VERSION="3.11.9"
echo "🐍 Installing Python $PYTHON_VERSION with lzma support via pyenv..."
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

# === PERSIST TO SHELL STARTUP FILES ===
echo "📜 Updating shell profile for future sessions..."
{
  echo 'eval "$('$(command -v brew)' shellenv)"'
  echo 'export PYENV_ROOT="$HOME/.pyenv"'
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"'
  echo 'eval "$(pyenv init --path)"'
} >> "$HOME/.zprofile"

{
  echo 'eval "$(pyenv init -)"'
  echo 'eval "$(pyenv virtualenv-init -)"'
} >> "$HOME/.zshrc"

# === VERIFY ENVIRONMENT ===
echo "🧪 Verifying tools..."
echo -n "Git: "; git --version
echo -n "Python: "; python --version
echo -n "Node: "; node --version
echo -n "VSCode: "; code --version || echo "⚠️ VSCode not found in PATH yet"

# === CREATE CLEAN WORKSPACE ===
mkdir -p "$HOME/code"
cd "$HOME/code"
echo "📁 Created ~/code for fresh clones"

# === OPTIONAL: Auto-clone Ukubona starter repo ===
# git clone https://github.com/yourorg/ukubona.git

echo "✅ Creative environment ready. Go forth and teach!"
