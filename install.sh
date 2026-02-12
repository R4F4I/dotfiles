#!/bin/bash

# --- CONFIGURATION ---
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# List of files to symlink (Repo File -> Target Location)
# Format: "filename_in_repo:target_path_relative_to_home"
declare -A FILES_TO_LINK=(
    [".bashrc"]=".bashrc"
    [".vimrc"]=".vimrc" 
    # Add more here like ["tmux.conf"]=".tmux.conf"
)

# List of packages available to install
PACKAGES=("eza" "g++" "gcc" "make" "neofetch")
SELECTED_PACKAGES=()

# --- COLORS ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# --- FUNCTIONS ---

print_header() {
    clear
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${BLUE}    R4F4I's Interactive Setup Script     ${NC}"
    echo -e "${BLUE}=========================================${NC}"
}

install_eza_repo() {
    # eza often needs a custom repo on Debian/Ubuntu
    echo -e "${BLUE}Configuring eza repositories...${NC}"
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
}

link_files() {
    echo -e "\n${GREEN}[+] Setting up Dotfiles...${NC}"
    mkdir -p "$BACKUP_DIR"
    
    for repo_file in "${!FILES_TO_LINK[@]}"; do
        target="$HOME/${FILES_TO_LINK[$repo_file]}"
        source="$DOTFILES_DIR/$repo_file"

        if [ -f "$source" ]; then
            # Backup existing file if it's not a symlink
            if [ -f "$target" ] && [ ! -L "$target" ]; then
                echo "    Backing up existing $target to $BACKUP_DIR"
                mv "$target" "$BACKUP_DIR"
            fi
            
            # Create the symlink
            echo "    Linking $repo_file -> $target"
            ln -sf "$source" "$target"
        else
            echo -e "${RED}    Error: $source not found in repo!${NC}"
        fi
    done
}

menu_selector() {
    echo -e "\n${GREEN}[+] Package Selection Menu${NC}"
    echo "Select packages to install (y/n):"
    
    for pkg in "${PACKAGES[@]}"; do
        read -p "    Install $pkg? (y/n): " choice
        case "$choice" in 
            y|Y ) SELECTED_PACKAGES+=("$pkg");;
            * ) ;;
        esac
    done
}

install_packages() {
    if [ ${#SELECTED_PACKAGES[@]} -eq 0 ]; then
        echo "No packages selected."
        return
    fi

    echo -e "\n${GREEN}[+] Installing: ${SELECTED_PACKAGES[*]}${NC}"
    
    # Special check for eza repo setup
    if [[ " ${SELECTED_PACKAGES[*]} " =~ " eza " ]]; then
        install_eza_repo
    fi

    sudo apt update
    sudo apt install -y "${SELECTED_PACKAGES[@]}"
}

# --- MAIN EXECUTION ---
print_header
link_files
menu_selector
install_packages

echo -e "\n${GREEN}Setup Complete! Restart your terminal to see changes.${NC}"