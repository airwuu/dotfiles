{ config, pkgs, inputs, lib, ... }:

let
  # Caelestia scripts derivation with Python shebang fixes
  caelestia-cli = pkgs.stdenv.mkDerivation rec {
    pname = "caelestia-cli";
    version = "1.0.1";

    src = pkgs.fetchFromGitHub {
      owner = "caelestia-dots";
      repo = "cli";
      rev = "v1.0.1";
      sha256 = "sha256-7m4hqYSgRe68lkzHFLb1GN5gQac4X4akKfKgFvhj/34="; 
    };

    nativeBuildInputs = with pkgs; [ makeWrapper ];

    # Define Python environment with dependencies
    buildInputs = with pkgs; [
      fish
      (python3.withPackages (ps: with ps; [
        materialyoucolor
        pillow
        setuptools
      ]))
    ];

    patchPhase = ''
      # Fix paths in fish files if any still exist and need it
      find . -name "*.fish" -type f | while read -r file; do
        sed -i 's|set -l data_dir .*|set -l data_dir $HOME/.local/share/caelestia|g' "$file"
      done
      
      # Fix paths in Python files to look for data in user directory
      find . -name "*.py" -type f | while read -r file; do
        sed -i 's|Path(__file__).parent.parent / "data"|Path.home() / ".local" / "share" / "caelestia"|g' "$file"
        sed -i 's|os.path.join(os.path.dirname(__file__), "..", "data")|os.path.expanduser("~/.local/share/caelestia")|g' "$file"
      done
    '';

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/share/caelestia-cli

      # Copy source files
      cp -r * $out/share/caelestia-cli/

      # Create setup script to populate ~/.local/share/caelestia
      cat > $out/bin/caelestia-setup <<EOF
      #!/bin/sh
      DATA_HOME="\$HOME/.local/share/caelestia"
      STATE_HOME="\$HOME/.local/state/caelestia"
      CACHE_HOME="\$HOME/.cache/caelestia"
      SRC_DATA="$out/share/caelestia-cli/src/caelestia/data"

      mkdir -p "\$DATA_HOME/schemes/dynamic"
      mkdir -p "\$DATA_HOME/templates"
      mkdir -p "\$STATE_HOME/wallpaper"
      mkdir -p "\$CACHE_HOME/schemes"

      # Copy default schemes if missing
      if [ -d "\$SRC_DATA/schemes" ]; then
        cp -rn "\$SRC_DATA/schemes/"* "\$DATA_HOME/schemes/"
      fi
      
      # Copy default templates if missing
      if [ -d "\$SRC_DATA/templates" ]; then
        cp -rn "\$SRC_DATA/templates/"* "\$DATA_HOME/templates/"
      fi

      # Copy config and emojis if missing
      if [ ! -f "\$DATA_HOME/config.json" ] && [ -f "\$SRC_DATA/config.json" ]; then
        cp "\$SRC_DATA/config.json" "\$DATA_HOME/"
      fi
      if [ ! -f "\$DATA_HOME/emojis.txt" ] && [ -f "\$SRC_DATA/emojis.txt" ]; then
        cp "\$SRC_DATA/emojis.txt" "\$DATA_HOME/"
      fi
      EOF
      chmod +x $out/bin/caelestia-setup

      # Create wrapper that runs the Python module
      makeWrapper ${pkgs.python3}/bin/python3 $out/bin/caelestia \
        --add-flags "-m caelestia" \
        --run "$out/bin/caelestia-setup" \
        --set PYTHONPATH "$out/share/caelestia-cli/src:${pkgs.python3Packages.materialyoucolor}/${pkgs.python3.sitePackages}:${pkgs.python3Packages.pillow}/${pkgs.python3.sitePackages}" \
        --prefix PATH : ${lib.makeBinPath (with pkgs; [
          imagemagick
          wl-clipboard
          fuzzel
          socat
          foot
          jq
          grim
          wayfreeze
          wl-screenrec
          git
          coreutils
          findutils
          gnugrep
          xdg-user-dirs
        ])}
    '';

    meta = with lib; {
      description = "Caelestia dotfiles scripts";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };

  # Wrap quickshell with Qt dependencies and required tools in PATH
  quickshell-wrapped = pkgs.runCommand "quickshell-wrapped" {
    nativeBuildInputs = [ pkgs.makeWrapper ];
  } ''
    mkdir -p $out/bin
    makeWrapper ${inputs.quickshell.packages.${pkgs.system}.default}/bin/qs $out/bin/qs \
      --prefix QT_PLUGIN_PATH : "${pkgs.qt6.qtbase}/${pkgs.qt6.qtbase.qtPluginPrefix}" \
      --prefix QT_PLUGIN_PATH : "${pkgs.qt6.qt5compat}/${pkgs.qt6.qtbase.qtPluginPrefix}" \
      --prefix QML2_IMPORT_PATH : "${pkgs.qt6.qt5compat}/${pkgs.qt6.qtbase.qtQmlPrefix}" \
      --prefix QML2_IMPORT_PATH : "${pkgs.qt6.qtdeclarative}/${pkgs.qt6.qtbase.qtQmlPrefix}" \
      --prefix PATH : ${lib.makeBinPath [ pkgs.fd pkgs.coreutils ]}
  '';

in
{
  options.programs.quickshell = {
    finalPackage = lib.mkOption {
      type = lib.types.package;
      default = quickshell-wrapped;
      description = "The wrapped quickshell package with Qt dependencies";
    };

    caelestia-cli = lib.mkOption {
      type = lib.types.package;
      default = caelestia-cli;
      description = "The caelestia scripts package";
    };
  };
}
