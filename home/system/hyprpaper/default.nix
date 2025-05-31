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
        "$HOME/Pictures/Wallpapers/akatsuki-no-hana.jpeg"
      ];

      wallpaper = [
        ",$HOME/Pictures/Wallpapers/akatsuki-no-hana.jpeg"
      ];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
