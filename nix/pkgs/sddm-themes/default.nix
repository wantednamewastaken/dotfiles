{ stdenv, lib, sddm, ... }:
#let
#	fs = lib.fileset;
#	sourceFiles = fs.unions [
#		./../../../../../../../../home/ryan/dotfiles/local/sddm/sddm.conf
#		./../../../../../../../../home/ryan/dotfiles/local/sddm/theme.conf
#	];
#in
#fs.trace sourceFiles
{
	stdenvNoCC.mkDerivation = {
		pname = "sddm-asdf";
		version = "1.0";
		#buildInputs = [ sddm ];
		dontBuild = true;
		src = ./../../../../../../../../home/ryan/dotfiles/local/sddm/sddm.conf;
		nativeBuildInputs = [ pkgs.sddm ];
		installPhase = ''
			mkdir -p $out/share/sddm/themes/sddm-theme-ml4w
			cp -aR $src $out/share/sddm/themes/sddm-theme-ml4w
		'';
		#installPhase = ''
		#	mkdir -p $pkgs.sddm/share/sddm/themes/sddm-theme-ml4w
		#	cp -aR $src $pkgs.sddm/share/sddm/themes/sddm-theme-ml4w
		#'';
	};
}
