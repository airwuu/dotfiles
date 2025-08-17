{ config, lib, ... }:
{
  config.var = {
    hostname = "pinto";
    username = "airwu";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # NixOS config directory
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    # Git config
    git = {
      username = "toxocious";
      email = "toxocious@gmail.com";
    };

    # Locale & Keyboard
    location = "Phoenix";
    timeZone = "America/Phoenix";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
