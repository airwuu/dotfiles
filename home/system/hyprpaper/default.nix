{ pkgs, config, lib, ... }:
let
  # Change this to a valid image path you always have (e.g., from your install script)
  fallbackWallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/trees.jpeg";
in
{
  services.hyprpaper = {
    enable = true;
    
    # 1. Static config to ensure the daemon starts successfully
    settings = {
      ipc = "on";
      splash = false;
      preload = [ fallbackWallpaper ];
      wallpaper = [ ",${fallbackWallpaper}" ];
    };
  };

  # 2. A simple one-shot service to restore the last wallpaper dynamically
  systemd.user.services.hyprpaper-restore = {
    Unit = {
      Description = "Restore last wallpaper from state file";
      After = [ "hyprpaper.service" ];
      Wants = [ "hyprpaper.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      # Small delay to ensure hyprpaper socket is ready
      ExecStart = pkgs.writeShellScript "restore-wallpaper" ''
        sleep 2
        STATE_FILE="$HOME/.local/state/caelestia/wallpaper/last.txt"
        
        if [ -f "$STATE_FILE" ]; then
           WALLPAPER=$(cat "$STATE_FILE" | tr -d '\n')
           if [ -f "$WALLPAPER" ]; then
             ${pkgs.hyprland}/bin/hyprctl hyprpaper preload "$WALLPAPER"
             ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",$WALLPAPER"
           fi
        fi
      '';
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}