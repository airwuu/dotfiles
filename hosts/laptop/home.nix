{ pkgs, lib, config, inputs, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/hypridle
        ../../home/system/hyprlock
        ../../home/system/hyprpaper
        ../../home/system/cursor
        ../../home/system/fish-shell
        ../../home/system/neofetch
        ../../home/system/git
        ../../home/system/java
	../../home/programs/waybar

        # Programs
        ../../home/programs/discord
        ../../home/programs/ghostty
        ../../home/programs/rofi
        ../../home/programs/spicetify
        ../../home/programs/starship
        ../../home/programs/foot

        # Shell
       # ../../home/quickshell
       inputs.caelestia-nix.homeManagerModules.default
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Apps
            brave
            inputs.zen-browser.packages."${system}".default
            firefox
            
            # Hyprland
            rofi
            hyprpaper
            wlogout

            # Development - Languages/Tools
            premake5
            nodejs
            python3

            # Development - IDE
            vscode
            vim
            tmux

            # Utilities
            grc
            zip
            unzip
            tree
            btop
            fish
            neofetch
            gtk3
            nautilus

            # Misc
            starship
            cava
            bluez
            ddcutil
            brightnessctl
            imagemagick
            networkmanagerapplet
            comma

            # Waybar Omarchy modules
            playerctl
            bc
            wttrbar
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };
    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/airwu/.config/nixos"; # sets NH_OS_FLAKE variable for you
  };

}
