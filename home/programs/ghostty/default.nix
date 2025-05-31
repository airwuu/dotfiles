{ pkgs, config, lib, ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      auto-update = "check";
      auto-update-channel = "stable";

      copy-on-select = "clipboard";

      background = "#000000";
      background-opacity = "0.65";
      background-blur-radius = "20";

      font-family = "JetBrains Mono, Nerd Font";
      font-size = 12;
      cursor-style = "bar";
      cursor-style-blink = true;
      cursor-invert-fg-bg = true;
      font-feature = [
        "liga"
        "calt"
      ];
     
      macos-window-shadow = true;
      macos-titlebar-style = "hidden";
      macos-option-as-alt = true;
      confirm-close-surface = false;
      
      window-theme = "dark";
      window-decoration = true;
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;

      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-trim-trailing-spaces = true;

	keybind = [ "cmd+t=new_tab" ];

#      keybinds = [
#       "cmd+t=new_tab"
#
#       "cmd+1=goto_tab:1"
#       "cmd+2=goto_tab:2"
#       "cmd+3=goto_tab:3"
#
#       "cmd+c=copy_to_clipboard"
#       "ctrl+shift+c=copy_to_clipboard"
#       "cmd+v=past_from_clipboard"
#       "ctrl+shift+v=past_from_clipboard"
#      ];
    };
  };
}
