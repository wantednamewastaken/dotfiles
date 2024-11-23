{ stdenv, ... }:

{
	sddm-theme-ml4w = stdenv.mkDerivation rec {
		pname = "sddm-theme-ml4w";
		version = "1.0";
		#buildInputs = [ sddm ];
		dontBuild = true;
		srcs = [
			/home/ryan/dotfiles/local/sddm/sddm.conf
			/home/ryan/dotfiles/local/sddm/theme.conf
		];
		installPhase = ''
			mkdir -p $out/share/sddm/themes
			cp -aR $src $out/share/sddm/themes/${pname}
		'';
	};
}
