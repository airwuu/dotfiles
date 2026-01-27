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

        # Programs
        ../../home/programs/discord
        ../../home/programs/ghostty
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
            waybar
            rofi
            hyprpaper

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
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };
    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };

    programs.caelestia-dots = {
        enable = true;

        # Disable modules that you already manage yourself to avoid conflicts
        hypr.enable = false;
        fish.enable = false;
        foot.enable = false;
        btop.enable = false;
        
        # Ensure the shell is active
        caelestia.shell.enable = true;
        
        # Optional: Override settings if needed
        # caelestia.shell.settings = { ... };
    };
}
