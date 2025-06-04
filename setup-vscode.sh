#!/bin/bash

echo "🎨 Setting up VSCode for Ukubona interns..."

# === Install VSCode Extensions ===
echo "📦 Installing essential extensions..."
# Web Development
code --install-extension ritwickdey.LiveServer
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension formulahendry.auto-rename-tag

# Python & Data Science
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter

# Productivity
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension github.copilot
code --install-extension GitHub.vscode-pull-request-github
code --install-extension EditorConfig.EditorConfig

# Markdown & Documentation
code --install-extension bierner.markdown-preview-github-styles
code --install-extension yzhang.markdown-all-in-one

# Data Analysis Specific
code --install-extension mechatroner.rainbow-csv  # Best colored CSV viewer
code --install-extension GrapeCity.gc-excelviewer # For Excel files
code --install-extension tomoki1207.pdf          # Best PDF reader for VSCode
code --install-extension kylelthomas.language-stata # Stata syntax highlighting
code --install-extension julialang.language-julia # For Julia support
code --install-extension Ikuyadeu.r              # For R support

# Theme
code --install-extension zhuangtongfa.material-theme

# === Create a starter project structure ===
echo "📁 Creating project folder..."
mkdir -p ~/ukubona_project/{data,analysis,.vscode}
cd ~/ukubona_project
touch index.html style.css script.js README.md 
touch data/mockdata.csv analysis/analysis.do analysis/script.R

# === Add VSCode settings ===
echo "🧠 Adding VSCode settings..."
cat > .vscode/settings.json <<EOF
{
  "editor.formatOnSave": true,
  "files.autoSave": "onWindowChange",
  "liveServer.settings.port": 5500,
  "editor.tabSize": 2,
  "files.associations": {
    "*.csv": "csv",
    "*.do": "stata",
    "*.rmd": "markdown"
  },
  "workbench.colorTheme": "One Dark Pro",
  "rainbow-csv.highlightOnLoad": true,
  "stataRunner.stataPath": "/usr/local/stata17/stata-se", // Update this path as needed
  "pdf.viewer": "pdf-viewer"
}
EOF

# === Add recommended extensions ===
cat > .vscode/extensions.json <<EOF
{
  "recommendations": [
    "mechatroner.rainbow-csv",
    "tomoki1207.pdf",
    "kylelthomas.language-stata",
    "ms-python.python",
    "ms-toolsai.jupyter"
  ]
}
EOF

echo "✅ VSCode setup complete with enhanced data analysis capabilities!"
echo "   Open the project folder with:"
echo "   code ~/ukubona_project"
