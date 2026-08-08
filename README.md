# Dotfiles — Dante

Przenośny backup konfiguracji środowiska desktopowego i terminalowego.

Zawiera:

- `src/dwm` — źródła i bieżące `config.h` dla DWM;
- `src/slstatus` — źródła i konfigurację paska statusu;
- `config/kitty`, `config/nvim`, `config/rofi`, `config/picom`, `config/waybar`, `config/fastfetch`, `config/btop`, `config/gtk-*`, `config/hypr`;
- `zshrc` — konfigurację Zsh;
- `packages/` — pakiety z oficjalnych repozytoriów i AUR.

Nie zawiera kluczy SSH, tokenów, haseł, cache, historii terminala ani skompilowanych binariów.

## Odtworzenie konfiguracji

```bash
git clone https://github.com/TWOJ_LOGIN/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Skrypt najpierw tworzy kopie istniejących konfiguracji w katalogu z datą, a następnie zakłada dowiązania symboliczne. DWM i slstatus trzeba zbudować osobno:

```bash
cd ~/dotfiles/src/dwm && sudo make clean install
cd ~/dotfiles/src/slstatus && sudo make clean install
```

## Pakiety

Oficjalne pakiety:

```bash
sudo pacman -S --needed - < packages/pacman-official.txt
```

Pakiety spoza oficjalnych repozytoriów są w `packages/aur.txt`; instaluj je przez AUR helper, np. `yay`.

## Publikacja na GitHubie

```bash
cd ~/dotfiles
gh auth refresh -h github.com -s repo
gh repo create dotfiles --private --source=. --remote=origin --push
```

Repozytorium jest domyślnie prywatne, bo zawiera osobiste ustawienia. Jeśli chcesz je publiczne, użyj zamiast tego flagi `--public`.
