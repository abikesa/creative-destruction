#!/bin/bash

echo "🧨 Starting destructive cleanup of your Mac dev environment..."

# === 1. Xcode CLI Tools ===
if [ -d "/Library/Developer/CommandLineTools" ]; then
  echo "🧹 Removing Xcode CLI tools..."
  sudo rm -rf /Library/Developer/CommandLineTools
else
  echo "✔️ Xcode CLI tools already removed"
fi

# === 2. .zprofile hygiene ===
if [ -f "$HOME/.zprofile" ]; then
  echo "🧽 Scrubbing .zprofile of brew/pyenv junk..."
  sed -i '' '/brew shellenv/d' "$HOME/.zprofile"
  sed -i '' '/PYENV_ROOT/d' "$HOME/.zprofile"
  sed -i '' '/pyenv init --path/d' "$HOME/.zprofile"
else
  echo "ℹ️ No .zprofile found"
fi

# === 3. Old dev folders ===
for folder in "$HOME/code" "$HOME/repos" "$HOME/dev"; do
  if [ -d "$folder" ]; then
    echo "🗑️ Removing $folder"
    rm -rf "$folder"
  fi
done

# === 4. Homebrew Nuclear Option ===
echo "☢️ Uninstalling Homebrew and all formulas..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew

# === 5. Dotfiles & Config Wipe ===
echo "🧽 Nuking ~/.gitconfig, ~/.npmrc, ~/.zshrc..."
rm -f ~/.gitconfig ~/.npmrc ~/.zshrc

# === 6. VSCode purge ===
echo "🗑️ Killing VSCode..."
rm -rf /Applications/Visual\ Studio\ Code.app
rm -rf ~/Library/Application\ Support/Code
rm -rf ~/.vscode

# === 7. pyenv exorcism ===
if [ -d "$HOME/.pyenv" ]; then
  echo "☠️ Removing pyenv..."
  rm -rf "$HOME/.pyenv"
fi

echo "🔥 Destruction complete. Mac is clean. Reinstall when ready."
