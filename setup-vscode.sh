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
