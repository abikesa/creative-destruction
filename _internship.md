## A. Work from Mac Terminal
1. `cat creative.sh`
   - manually preview file
   - copy and paste `xcode` line
      - `xcode-select --install` 
   - lookout for a pop-up window
   - click install
   - this will take 5-15 minutes
   - `xcode-select -p` to confirm installation
      - `/Library/Developer/CommandLineTools` confirms installation
   - now copy & paste `homebrew` line
      - `which homebrew` 
      - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
      - follow additional instructions to activate homebrew
2. now lets run [creative.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/creative.sh)
   - `curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/creative.sh | bash`
   - `brew install --cask visual-studio-code` (redundancy for now)

## B. Work from VS Code
3. visual studio code installed
   - `echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zprofile`
   - `source ~/.zprofile`
   - `code --version`
3. then [setup-vscode.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/setup-vscode.sh)
   - `curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/setup-vscode.sh | bash`
4. `nano ~/.gitconfig`
   - manually edit

    ```
    [user]
       name = Your Full Name
       email = your@email.com
    ```

   - `git config --global --list`
   - `cat ~/.gitconfig`

5. ukubona-classic
   - clone
   - edit
   - push
      - if prompted for password?
      - use your mac password
      - **NOT** github 
   - branch: i-ukb-0-001
6. [retired](https://ukubona-llc.github.io/vscode/)
7. pull request
8. [destructive.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/destructive.sh)

---

Yes, the flow you’re aiming for is *nearly perfect*, but based on your terminal output, here's **exactly what needs to happen *after* running `creative.sh`**, to ensure the environment is clean, reproducible, and operational for all Ukubona interns or devs.

---

## ✅ Post-`creative.sh` Checklist (2025 Edition)

### 1. **Install VSCode (if not already installed)**

Despite being listed in `creative.sh`, VSCode installation *did not complete* (likely skipped or failed silently):

```bash
brew install --cask visual-studio-code
```

Optional: add to `.zprofile`:

```bash
echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zprofile
```

Then either restart terminal or run:

```bash
source ~/.zprofile
```

Confirm it works:

```bash
code --version
```

---

### 2. **Fix missing `.zshrc` for pyenv**

If you saw `source: no such file or directory: /Users/hades/.zshrc`, then do:

```bash
touch ~/.zshrc
```

Append pyenv setup manually:

```bash
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
```

Then source both:

```bash
source ~/.zprofile
source ~/.zshrc
```

---

### 3. **Ensure `pyenv` Python is active**

```bash
pyenv global 3.11.9
python --version
which python
```

You should *not* see `/usr/bin/python`. Instead you want:

```
/Users/hades/.pyenv/versions/3.11.9/bin/python
```

---

### 4. **Rerun setup-vscode.sh**

Now that `code` is available, this will actually install the intern extensions:

```bash
curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/setup-vscode.sh | bash
```

Double-check that extensions were installed with:

```bash
code --list-extensions
```

---

### 5. **Continue Workflow**

Now you’re back on track:

* `nano ~/.gitconfig`
* `git clone https://github.com/ukubona-llc/ukubona-classic.git`
* `cd ukubona-classic`
* `git checkout -b i-ukb-0-001`
* Open with VSCode:

  ```bash
  code .
  ```

---

### 🧨 Optional Cleanup

If things get weird again, run:

```bash
curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/destructive.sh | bash
```

And start fresh with `creative.sh`.

---

Let me know if you want me to generate a **single `verify.sh` script** that checks `code`, `python`, `pyenv`, `.zshrc`, and key VSCode extensions.
