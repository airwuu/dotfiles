{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Kill active window
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      # Bindings to open applications
      "$mod, C, exec, code"         # Open VS Code
      "$mod, SPACE, exec, ghostty"  # Open Ghostty terminal
      "$mod, B, exec, brave"        # Open Brave browser

      # Screenshot with hyprshot
      "$mod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh region"
      "$shiftMod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh monitor"

      # Caelestia shell bindings
      #"$mod, RETURN, exec, caelestia-quickshell shell toggle launcher"
      "$mod, D, exec, caelestia-quickshell shell toggle dashboard"
      "$mod, S, exec, caelestia-quickshell shell toggle session"

      # Volume and Media Keys
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

      # Brightness Keys
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ] ++ ( builtins.concatLists(builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) totalWorkspaces
    ));
    bindr = [
      #",SUPER, exec, caelestia-quickshell shell toggle launcher"
      "SUPER, SUPER_L, exec, caelestia-quickshell shell toggle launcher"
    ];
    bindm = [
      # Move window with mainMod + LMB
      "$mod, mouse:272, movewindow"
    ];
  };
}
