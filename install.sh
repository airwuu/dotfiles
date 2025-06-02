# Check if hostname argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <hostname>"
  exit 1
fi

HOSTNAME=$1

# Create base directories that will be used later.
echo "Creating core directories in ${HOME}"
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Pictures/Wallpapers
sudo cp ./assets/wallpapers/. ~Pictures/Wallpapers
mkdir -p ~/Videos
echo " - Core directories have been created"
echo ""

# Backing up nixos hardware configuration.
echo "Backing up your NixOS Hardware Configuration"
sudo cp /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix.bak
echo " - Backup complete (/etc/nixos/hardware-configuration.nix.bak)"
echo ""

# Copy the dotfiles and nix configuration files into .config/nixos.
echo "Copying dotfiles into ${HOME}/.config/nixos"
mkdir -p ~/.config/nixos
sudo cp -ra ./. ~/.config/nixos
echo " - Copying complete."
echo ""

# Rebuild nixos
echo "Rebuilding nixos using the flake with hostname: $HOSTNAME"
sudo nixos-rebuild switch --flake ~/.config/nixos#$HOSTNAME
