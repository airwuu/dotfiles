{ config, lib, pkgs, ... }:
{
  imports = [
    # System configurations
    ../../nixos/boot-manager.nix
    ../../nixos/nvidia.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/hyprland.nix
    ../../nixos/virtualization.nix

    # Machine-specific hardware configuration
    ./hardware-configuration.nix

    # Host specific variables
    ./variables.nix
  ];

  # Setup Home Manager for our user
  home-manager.users."${config.var.username}" = import ./home.nix;

  # NixOS Version - Don't Change
  system.stateVersion = "24.11";
}
