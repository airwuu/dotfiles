{
  description = "Toxocious's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./fingerprint-scanner.nix
        ./sound.nix
        ./usb.nix
        ./time.nix
        ./swap.nix
        ./bootloader.nix
        ./nix-settings.nix
        ./nixpkgs.nix
        ./gc.nix
        ./auto-upgrade.nix
        ./linux-kernel.nix
        ./screen.nix
        ./display-manager.nix
        ./theme.nix
        ./internationalisation.nix
        ./fonts.nix
        ./security-services.nix
        ./services.nix
        ./hyprland.nix
        ./environment-variables.nix
        ./bluetooth.nix
        ./networking.nix
        ./open-ssh.nix
        ./firewall.nix
        ./dns.nix
        ./users.nix
        ./virtualisation.nix
        ./programming-languages.nix
        ./lsp.nix
        ./rust.nix
        ./wasm.nix
        ./info-fetchers.nix
        ./utils.nix
        ./terminal-utils.nix

        # ./printing.nix
        # ./gnome.nix
        # ./mac-randomize.nix
        # ./vpn.nix
      ];
    };
  };
}
