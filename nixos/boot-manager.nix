{ config, pkgs, lib, ... }:
{
  # services.xserver.videoDrivers = [ ];

  console = {
    earlySetup = false;
  };

  boot = {
    consoleLogLevel = 0;

    plymouth = {
      enable = true;

      theme = "breeze";
      themePackages = with pkgs; [
        plymouth (kdePackages.breeze-plymouth.override { })
      ];
    };

    initrd = {
      verbose = false;
      kernelModules = [ ];
    };

    loader = {
      timeout = 0;

      systemd-boot.enable = false;

      efi.canTouchEfiVariables = true;

      grub = {
	enable = true;
	useOSProber = false;
	efiSupport = false;
	splashImage = null;
        
        device = "/dev/sda";
      };
    };

    kernelParams = [
      "quiet" "splash" "boot.shell_on_fail" "logLevel=3" "udev.log_priority=3" "rd.udev.log_level=3" "rd.systemd.show_status=false"
    ];
  };
}
