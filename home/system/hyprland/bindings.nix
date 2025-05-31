{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
     "$mod, Q, killactive"

     "$mod, RETURN, exec, anyrun"

     "$mod, SPACE, exec, uwsm app --${pkgs.ghostty}/bin/ghostty"
    ] ++ ( builtins.concatLists(builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) totalWorkspaces
    ));
  };
}
