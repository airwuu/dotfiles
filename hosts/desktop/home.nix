{ pkgs, config, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/hypridle
        ../../home/system/hyprlock
        ../../home/system/cursor
        ../../home/system/fish-shell
        ../../home/system/neofetch

        # Programs
        ../../home/programs/discord
        ../../home/system/git
        ../../home/programs/ghostty

        # Shell
        ../../home/quickshell
    ];


    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Apps
            brave

            # Development - Languages/Tools
            premake5
            nodejs
            python3

            # Development - IDE
            vscode

            # Utilities
            grc
            zip
            unzip
            tree
            btop
            fish
            neofetch
            gtk3

            # Misc
            cava
            bluez
            ddcutil
            brightnessctl
            imagemagick
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };

    # GTK Configuration
    # gtk = {
    #     enable = true;

    #     theme = {
    #         name = "Catppuccin-Mocha-Dark";
    #         package = pkgs.catppuccin-gtk;
    #     };

    #     iconTheme = {
    #       name = "Papirus-Dark"; # Or a Catppuccin icon theme if available and preferred
    #       package = pkgs.papirus-icon-theme; # Or pkgs.catppuccin-icons
    #     };

    #     gtk3.extraConfig = {
    #         gtk-application-prefer-dark-theme = 1;
    #     };
    #     gtk4.extraConfig = {
    #         gtk-application-prefer-dark-theme = 1;
    #     };
    # };

    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };
}
