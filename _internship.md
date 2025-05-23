0. `cat creative.sh`
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
      - do **NOT** follow the nextsteps that a successful homebrew suggests
         - we already include this in `creative.sh` 
2. now lets run [creative.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/creative.sh)
   - `curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/creative.sh | bash`
4. then [setup-vscode.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/setup-vscode.sh)
   - `curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/setup-vscode.sh | bash`
6. `nano ~/.gitconfig`
7. ukubona-classic
   - clone
   - edit
   - push
   - branch: i-ukb-0-001
8. [retired](https://ukubona-llc.github.io/vscode/)
9. pull request
10. [destructive.sh](https://raw.githubusercontent.com/abikesa/creative-destruction/refs/heads/main/destructive.sh)
