{
  #config,
  #pkgs,
  #lib,
  ...
}:
{
	home-manager.users.ryan.programs.librewolf = {
		enable = true;
		#package = ;
		settings = {
			"privacy.resistFingerprinting.letterboxing" = true;
			#"network.http.referer.XOriginPolicy" = 2;
			#"media.autoplay.blocking_policy" = 2;
		};
	};
}
