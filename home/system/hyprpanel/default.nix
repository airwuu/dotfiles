{ inputs, config, ... }:
{
    imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

    programs.hyprpanel = {
        enable = true;
        hyprland.enable = true;
        overwrite.enable = true;
        overlay.enable = true;
        systemd.enable = true;

        # Override final config values.
        override = {

        };

        # General settings
        settings = {
            theme = {
                font.size = "12";

                bar = {
                    transparent = true;
                    floating = true;

                    location = "top";
                    buttons.padding_x = "0.8rem";
                    buttons.padding_y = "0.4rem";

                    buttons.monochrome = true;
                    menus.monochrome = true;
                };
            };

            bar = {
                workspaces.show_numbered = false;
                workspaces.workspaces = 9;
                workspaces.numbered_active_indicator = "color";
                workspaces.monitorSpecific = false;
                workspaces.showApplicationIcons = true;
                workspaces.showWsIcons = true;

                # clock = {
                #     format = "%b %d %I:%M %p";
                #     showIcon = false;
                # };

                windowtitle = {
                    label = true;
                };
                volume = {
                    label = false;
                };
                network = {
                    truncation_size = 12;
                };
                bluetooth = {
                    label = false;
                };
                notifications = {
                    show_total = true;
                };
                media = {
                    show_active_only = true;
                };
            };

            notifications = {
                position = "top right";
                showActionsOnHover = true;
            };

            layout = {
                "bar" = {
                    "scaling" = 1.0;
                    "monitor" = "DP-1";
                };

                "bar.layouts" = {
                    "*" = {
                        "left" = [ "dashboard" "workspaces" "windowtitle" ];
                        "middle" = [ "media" ];
                        "right" = [ "volume" "network" "clock" "systray" "notifications" ];
                    };
                };
            };
        };
    };

    home.file = {
        "/home/" + config.var.username + "/.config/hyprpanel/config.json".text = ''
            {
                "bar.clock.format": "%b %d %I:%M %p",
                "bar.clock.showIcon": false
            }
        '';
    };
}
