{
  security.rtkit.enable = true;
  
  services.pulseaudio = {
    enable = false;
  };

  services.pipewire = {
    enable = true;
    
    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
    jack.enable = true;

    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = { main."monitor.libcamera" = "disabled"; };
        };
	"50-alsa-config.lua" = {
        	"alsa_monitor.rules" = [
          	{
            	"matches" = [
              	{	
                	"node.name" = "~alsa_output.*";
              }
            ];
            "actions" = {
              "update-props" = {
                "session.suspend-timeout-seconds" = 0; # 0 disables suspend
              };
            };
          }
        ];
      };
      };
    };
  };
}
