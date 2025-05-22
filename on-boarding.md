
# ✨ Creative Destruction: Ukubona Onboarding Liturgy



## ✅ Is Your Mac *Truly* Factory Fresh?

> Spoiler: It probably isn’t.

You don’t need to reinstall macOS unless you’re paranoid (which is sometimes correct). Instead, verify this simple checklist.

---

<details>
<summary>1. <strong>Developer Tools?</strong></summary>

```bash
xcode-select -p
````

If this returns:

```
/Library/Developer/CommandLineTools
```

It means **Xcode CLI Tools are installed**, and the system is **not fresh**.
A clean mac should prompt you to install them.

</details>

---

<details>
<summary>2. <strong>Homebrew?</strong></summary>

```bash
which brew
```

If this returns something like `/opt/homebrew/bin/brew`, then Brew is installed.

> A factory-fresh macOS should have **no trace of Homebrew**.

</details>

---

<details>
<summary>3. <strong>Git / Python / Node?</strong></summary>

Run:

```bash
git --version
python3 --version
node --version
```

* `git` should trigger an install popup if it’s truly fresh.
* `python3` might show Apple's stub (`3.x.x`), but **no `pyenv` or Brew versions**.
* `node` should return **command not found**.

> Anything else means it’s been touched.

</details>

---

<details>
<summary>4. <strong>VSCode?</strong></summary>

Check for presence via either:

```bash
ls /Applications | grep -i code
```

or:

```bash
mdfind "kMDItemDisplayName == 'Visual Studio Code'"
```

If either returns results, the system is **not fresh**.

</details>

---

<details>
<summary>5. <strong>Dotfiles?</strong></summary>

```bash
ls -a ~ | grep -E '\.zshrc|\.bash_profile|\.gitconfig|\.npmrc'
```

These files store personal configuration and tooling. A **clean machine** should not have any of them.

> Dotfiles = developer residue.

</details>

---

## 🧼 Want Cleanliness Without Reinstalling macOS?

Here’s a pro move: **create a fresh macOS user account**.

<details>
<summary>🧑‍💻 Steps</summary>

1. Go to **System Settings → Users & Groups → Add User**.
2. Choose “Administrator” for full access.
3. Log in as that user.
4. Use this as your **sandboxed dev account**—perfect for interns or testing your bootstrap scripts.

</details>

This lets you run clean installs **without wiping the machine**, perfect for sandboxing.

---

## 🧪 Ritualize VSCode Setup

Once you’ve confirmed the system is clean, document the essential VSCode ritual.

<details>
<summary>🔧 Basic Setup</summary>

```bash
brew install --cask visual-studio-code
```

Launch VSCode once to initialize user directories.

</details>

<details>
<summary>🔌 Install Extensions</summary>

```bash
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension your-org.standard-stack
```

You can also batch install from a file:

```bash
xargs -n1 code --install-extension < vscode-extensions.txt
```

</details>

<details>
<summary>⚙️ Optional: Sync Your VSCode Settings</summary>

```bash
ln -s /path/to/settings.json \
  ~/Library/Application\ Support/Code/User/settings.json
```

This links your canonical config to the current user profile.

</details>

---

## 💡 The First Command an Intern Should Ever Run

```bash
curl -fsSL https://yourdomain.com/bootstrap.sh | bash
```

This is not just automation.
This is not just onboarding.

> This is **liturgical genesis.**

Creative destruction should feel like **Genesis 1**, not a middle-school group project.

---

### 🔁 Related Scripts

* [`destructive.sh`](https://yourdomain.com/destructive.sh) — wipes all trace.
* [`creative.sh`](https://yourdomain.com/creative.sh) — builds from scratch.
* [`bootstrap.sh`](https://yourdomain.com/bootstrap.sh) — optional wrapper.

---

🌀 *Rinse. Repeat. Transcend.*

```

---

Let me know the real URL for `bootstrap.sh` and I’ll wire it in. This version is **clean enough to canonize**—and will make your onboarding feel like a ceremony, not a chore.

