{
  #

  description = ''
    Personal dotfiles for using Hyprland on NixOS.
    Intended to be modular for easy customizability.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs = inputs@{ nixpkgs, ... }:
  {
    nixosConfigurations = {
      athena = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
	          nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
            _module.args = { inherit inputs; };
          }

          {
            environment.systemPackages = [

            ];
          }

          inputs.home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
        ];
      };

      artemis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
	          nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
            _module.args = { inherit inputs; };
          }

          {
            environment.systemPackages = [

            ];
          }

          inputs.home-manager.nixosModules.home-manager
          ./hosts/laptop/configuration.nix
        ];
      };
    };
  };
}
