#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="${HOME}/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link_path() {
    local source_path="$1"
    local target_path="$2"

    if [[ -e "$target_path" || -L "$target_path" ]]; then
        mkdir -p "$backup_dir"
        mv "$target_path" "$backup_dir/"
        printf 'Backup: %s\n' "$target_path"
    fi

    mkdir -p "$(dirname "$target_path")"
    ln -s "$source_path" "$target_path"
    printf 'Linked: %s\n' "$target_path"
}

for app in kitty nvim rofi picom waybar fastfetch btop gtk-3.0 gtk-4.0 hypr; do
    link_path "$repo_dir/config/$app" "$HOME/.config/$app"
done

link_path "$repo_dir/zshrc" "$HOME/.zshrc"
printf 'Done. Existing files, if any, are in %s\n' "$backup_dir"
