# HyprPaper is used to set the active wallpaper for the system
{ lib, ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "$HOME/Pictures/Wallpapers/frieren_.jpg"
      ];

      wallpaper = [
        ",$HOME/Pictures/Wallpapers/frieren_.jpg"
      ];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
