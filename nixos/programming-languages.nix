{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Node.js
    nodePackages_latest.nodejs
    bun

    # C/C++
    gnumake
    cmake
    premake5
    rocmPackages.llvm.clang

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
