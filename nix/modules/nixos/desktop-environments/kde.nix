{
  #config,
  pkgs,
  #lib,
  ...
}:
{
	imports = [
		#./themes
	];

	qt = {
		enable = true;
		platformTheme = "";
		style = {
			#package = ;
			#name = "";
		};
		kde.settings = {
		};
	};

  environment.systemPackages = with pkgs; [
		adwaita-qt
		arc-kde-theme
		#adapta-kde-theme
		#materia-kde-theme
		#graphite-kde-theme
  ];

	services = {
		desktopManager.plasma6.enable = true;
	};
}
