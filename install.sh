# Create base directories that will be used later.
echo "Creating core directories in ${HOME}"
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Videos
echo " - Core directories have been created"
echo ""

# Copy the dotfiles and nix configuration files into .config/nixos.
echo "Copying dotfiles into ${HOME}/.config/nixos"
mkdir -p ~/.config/nixos
cp -ra ./. ~/.config/nixos
echo " - Copying complete."
echo ""

# Rebuild nixos
echo "Rebuilding nixos using the flake"
sudo nixos-rebuild switch --flake ~/.config/nixos#nix
