{
  #config,
  pkgs,
	#system,
	#stdenv,
  lib,
	#inputs,
	#outputs,
  ...
}:

{
	home-manager.users.ryan = {
	qt = {
		enable = true;
		platformTheme.name = "gtk"; #"adwaita";
		style = {
			#name = "Tokyonight-Dark-B";
			#package = pkgs.tokyonight-gtk-theme;
			name = "adwaita-dark";
			package = pkgs.adwaita-qt;
		};
	};
	};

	#environment.variables = {
	# 	# This will become a global environment variable
	#  "QT_STYLE_OVERRIDE"="adwaita-dark";
	#};
	#qt.style = "adwaita-dark";
}
