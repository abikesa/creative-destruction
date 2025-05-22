#!/bin/bash

#!/bin/bash
trap 'echo "💥 Script failed at line $LINENO. Aborting." && exit 1' ERR
echo "🌱 Rebuilding Ukubona Dev Environment..."

# === XCODE CLI TOOLS ===
echo "🔧 Installing Xcode CLI Tools..."
xcode-select --install 2>/dev/null || echo "✔️ Xcode CLI Tools already installed"

# === INSTALL HOMEBREW ===
echo "🍺 Checking Homebrew..."
if ! command -v brew &> /dev/null; then
  echo "📦 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Post-install: Determine correct path
  if [[ -d "/opt/homebrew" ]]; then
    BREW_PREFIX="/opt/homebrew"
  elif [[ -d "/usr/local/Homebrew" ]]; then
    BREW_PREFIX="/usr/local"
  else
    echo "❌ Homebrew install failed or not found in expected paths."
    echo "   ➤ Try running the installer manually:"
    echo "     /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
  fi

  echo 'eval "$('"$BREW_PREFIX"'/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$("$BREW_PREFIX"/bin/brew shellenv)"
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
