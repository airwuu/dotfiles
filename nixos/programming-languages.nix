{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Node.js
    nodePackages_latest.nodejs
    bun

    # C/C++
    cmake

    # Rust
    rustup

    # Go
    go

    # Python
    (python311Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip]))

    # Lua
    lua
  ];
}
