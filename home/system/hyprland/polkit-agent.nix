# HyprPolkitAgent is a simple polkit agent used with Wayland compositors.
{ pkgs, ... }:
{
  home.packages = with pkgs; [ hyprpolkitagent ];

  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start hyprpolkitagent" ];
}
