{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neofetch
    btop

    dig
  ];
}
