{ lib, inputs, pkgs, ... }:
{
#  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;

    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      
      hideIcons = false;
      maxEntries = null;

      layer = "overlay";

      plugins = [
         inputs.anyrun.packages.${pkgs.system}.applications
      ];
    };

    extraCss = ''
      #window { background-color: rgba(0, 0, 0, 0); }
      
      box#main { border-radius: 8px; background-color: rgba(38, 38, 38, 0.8); border: 2px solid #7e9cd8; }

      entry#main { min-height: 40px; border-radius: 8px; background: transparent; box-shadow: none; border: none; }

      list#main { background-color: rgba(0, 0, 0, 0); }

      #match { padding: 3px; }
      #match:selected { background: transparent; border-color: #7e9cd8; border-left: 2px solid; border-right: 2px solid; border-radius: 4px; color: #7e9cd8; }
      #match:selected label#info { color: #b0b0b0; }
      #match label#info { color: transparent; }
      #match:hover { background: transparent; }
      
      label#match-desc { font-size: 10px; color: #b0b0b0; }
      label#plugin { font-size: 14px; }
    '';
  };
}
