{
  #config,
  pkgs,
	#system,
	#stdenv,
  #lib,
	#inputs,
	#outputs,
  ...
}:
{
	# FIXME: None of this shit works, even though it builds
	#xdg.mime.defaultApplications = {
	#	"application/pdf" = "librewolf.desktop";
	#	"image/jpeg" = [
	#		"loupe.desktop"
	#	];
	#	"image/png" = [
	#		"loupe.desktop"
	#		"gimp.desktop"
	#	];
	#};

	#home-manager.verbose = true;
	home-manager.users.ryan = {
		# FIXME: Builds fine but settings don't take effect
		xdg.mime.enable = true;
		xdg.mimeApps = {
			enable = true;
			defaultApplications = {
				"application/pdf" = "librewolf.desktop";
				"image/jpeg" = [
					"org.gnome.Loupe.desktop"
				];
				"image/png" = [
					"org.gnome.Loupe.desktop"
					"gimp.desktop"
				];
			};
		};
	};
}
