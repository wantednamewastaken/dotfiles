#{
#	#stdenv,
#	...
#}:

{ 
	pkgs, 
	nixpkgs,
	config,
	#stdenv,
	lib, 
	... 
}:
#{
#  inputs,
#  outputs,
#  lib,
#  config,
#  pkgs,
#	#nixpkgs-unstable,
#  ...
#}:
#with import <nixpkgs> {};

	pkgs.stdenv.mkDerivation {
		pname = "sddm-theme-ml4w";
		version = "1";
		#dontBuild = true;
		srcs = [
			/home/ryan/dotfiles/local/sddm.conf
			/home/ryan/dotfiles/local/theme.conf
		];
		installPhase = ''
			mkdir -p $out/share/sddm/themes/ml4w
			cp -aR $src $out/share/sddm/themes/ml4w
		'';
	}
