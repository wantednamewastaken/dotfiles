{
  #config,
  #pkgs,
  #lib,
  ...
}:
{
	services.flatpak = {
		enable = true;
		packages = [
			"com.github.iwalton3.jellyfin-media-player"
			"com.github.paolostivanin.OTPClient"
			"com.github.tchx84.Flatseal"
			#"com.github.wwmm.pulseeffects"
			#"com.valvesoftware.Steam"
			#"org.DolphinEmu.dolphin-emu"
		];
	};

  #environment.systemPackages = with pkgs; [
	#	
	#];
}
