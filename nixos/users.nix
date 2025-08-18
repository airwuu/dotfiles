{ config, pkgs, ... }:
let username = config.var.username;
in {
  users = {
    users.${username} = {
      isNormalUser = true;
      description = "{$username} Account";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "hello";
      shell = pkgs.fish;
    };
  };
 programs.fish.enable = true;
}
