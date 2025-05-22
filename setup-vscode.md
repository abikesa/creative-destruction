Yes, *some* of this can go in a `.sh` file—but **not all of it**, because:

1. Things like right-clicking in VSCode or GUI preference changes obviously can’t be scripted.
2. Some commands (like launching VSCode settings or GUI-based browser changes) require human interaction.

That said, **you can absolutely write a `setup_vscode.sh` script** that:

* Installs the extensions via `code --install-extension`
* Creates the folder layout
* Writes a starter `.vscode/settings.json` file

Here's a clean, executable `.sh` script version you can run **after installing VSCode** (e.g., right after `creative.sh`):

```bash
#!/bin/bash

echo "🎨 Setting up VSCode for Ukubona interns..."

# === Install VSCode Extensions ===
echo "📦 Installing extensions..."
code --install-extension ritwickdey.LiveServer
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
code --install-extension formulahendry.auto-rename-tag
code --install-extension esbenp.prettier-vscode
code --install-extension bierner.markdown-preview-github-styles
code --install-extension mechatroner.rainbow-csv
code --install-extension eamodio.gitlens
code --install-extension github.copilot
code --install-extension GitHub.vscode-pull-request-github
code --install-extension EditorConfig.EditorConfig
code --install-extension zhuangtongfa.material-theme

# === Create a starter project structure ===
echo "📁 Creating project folder..."
mkdir -p ~/ukubona_project/{data,.vscode}
cd ~/ukubona_project
touch index.html style.css script.js README.md data/mockdata.csv

# === Add VSCode settings ===
echo "🧠 Adding VSCode settings..."
cat > .vscode/settings.json <<EOF
{
  "editor.formatOnSave": true,
  "files.autoSave": "onWindowChange",
  "liveServer.settings.port": 5500,
  "editor.tabSize": 2,
  "files.associations": {
    "*.csv": "csv"
  }
}
EOF

echo "✅ VSCode setup complete. Open the folder with:"
echo "   code ~/ukubona_project"
```

---

### 🔧 To Use This Script

1. Save it as `setup_vscode.sh`
2. Make it executable:

```bash
chmod +x setup_vscode.sh
```

3. Run it:

```bash
./setup_vscode.sh
```

---

Would you like this wrapped in a GitHub Gist or dropped into your Ukubona template repo? I can also version it per intern or add profile-specific `.zshrc` exports for pyenv, Live Server port, etc.
