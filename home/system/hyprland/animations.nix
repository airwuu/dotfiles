{ config, ... }:
let
  animationSpeed = "0.5";
in
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = false;
    };
  };
}

