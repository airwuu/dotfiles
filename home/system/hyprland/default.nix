{ pkgs, config, inputs, lib, ... }:
let
  border-size = "2";
  gaps-in = "8";
  gaps-out = "8";
  active-opacity = "1.0";
  inactive-opacity = "0.69";
  rounding = "8";
  blur = true;
  keyboardLayout = config.var.keyboardLayout;
in
{
  imports = [
    ./animations.nix
    ./bindings.nix
  ];

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6ct

    wayland-utils
    wayland-protocols

    hyprpolkitagent
    hyprshot
    hyprpicker

    wlr-randr
    wl-clipboard

    libva
    dconf
    glib
    direnv

    meson
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = false;
      variables = [ "--all" ];
    };

    package = null;
    portalPackage = null;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      exec-once = [
        "dbus-update-activation-environment --systemd --all &"
        "systemctl --user start hyprpolkitagent &"
        "systemctl --user enable --now hyprpaper.service &"
        "systemctl --user enable --now hypridle.service &"
	    "hyprctl setcursor phinger-cursors-light 14"
        "hyprpaper &"
      ];

      monitor = [
        # "DP-1,2560x1440@240,auto,1" # Primary monitor
	    ",prefered,auto,1" #Default everything
      ];

      env = [
       "XDG_CURRENT_DESKTOP,Hyprland"
       "MOZ_ENABLE_WAYLAND,1"
       "ANKI_WAYLAND,1"
       "DISABLE_QT5_COMPAT,0"
       "NIXOS_OZONE_WL,1"
       "XDG_SESSION_TYPE,wayland"
       "XDG_SESSION_DESKTOP,Hyprland"
       "QT_AUTO_SCREEN_SCALE_FACTOR,1"
       "QT_QPA_PLATFORM=wayland,xcb"
       "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
       "ELECTRON_OZONE_PLATFORM_HINT,auto"
       "__GL_GSYNC_ALLOWED,1"
       "__GL_VRR_ALLOWED,1"
       "DIRENV_LOG_FORMAT,"
       "WLR_DRM_NO_ATOMIC,1"
       "WLR_BACKEND,vulkan"
       "WLR_RENDERER,vulkan"
       "WLR_NO_HARDWARE_CURSORS,1"
       "SDL_VIDEODRIVER,wayland"
       "CLUTTER_BACKEND,wayland"
      ];

      cursor = {
        no_hardware_cursors = true;
        default_monitor = "DP-1";
      };

      general = {
        resize_on_border = true;
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        layout = "master";
      };

      decoration = {
        active_opacity = active-opacity;
        inactive_opacity = inactive-opacity;
        rounding = rounding;
        shadow = {
          enabled = true;
          range = 8;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 12;
        };
      };

      master = {
        new_status = true;
        allow_small_split = true;
        mfact = 0.5;
      };

      gestures = { };

      misc = {
        vfr = true;
        disable_hyprland_logo = false;
        disable_splash_rendering = false;
        disable_autoreload = false;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
      };

      layerrule = [ "noanim, launcher" "noanim, ^args-.*" ];

      input = {
        kb_layout = keyboardLayout;
        # kb_options = "caps:escape";

        follow_mouse = 1;
        sensitivity = 1;
        repeat_delay = 300;
        repeat_rate = 50;
      };
    };
  };
}
