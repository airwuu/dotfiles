{ pkgs, lib, config, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # Programs
        ../../home/programs/discord
        ../../home/programs/git
        ../../home/programs/ghostty

        # Scripts

        # System
        ../../home/system/hyprpaper
        ../../home/system/hyprland
        ../../home/system/hyprpanel
        ../../home/system/hypridle
        ../../home/system/hyprlock
        ../../home/system/cursor
        ../../home/system/launcher
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
        # Apps
        brave

        # Development - Languages
        nodejs
        python3

        # Development - IDE
        vscode

        # Utilities
        zip
        unzip
        tree
        btop
        neofetch
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };

    # Enable Home Manager
    programs.home-manager = {
        enable = true;
        # nixVersions.stable = true;
    };
}
