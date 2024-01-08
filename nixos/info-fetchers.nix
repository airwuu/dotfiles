{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neofetch
    btop

    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    # nvtop
    dig
  ];
}
