{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nodemon
    nodePackages_latest.nodemon

    # TypeScript
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server

    # Python
    python311Packages.python-lsp-server

    marksman # Markdown
    nil      # Nix
    gopls    # Go // LSP
    delve    # Go // Debugger
  ];
}
