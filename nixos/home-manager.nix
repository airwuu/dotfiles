{ inputs, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm-backup";

    extraSpecialArgs = { inherit inputs; };
  };

  # Enable Home Manager
  programs.home-manager.enable = true;
  programs.home-manager.nixVersions.stable = true;
}
