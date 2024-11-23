{
	pkgs,
	#lib,
	stdenv,
	...
}: {
  environment.systemPackages = with pkgs; [
		ags
		bun
		gtop
		#rPackages.gtop
		gtk-layer-shell
		gtk4-layer-shell
	];

	#stdenv.mkDerivation = rec {
	#	buildInputs = [
	#		pkgs.ags
	#		pkgs.bun
	#		pkgs.gtop
	#		#pkgs.rPackages.gtop
	#		pkgs.gtk-layer-shell
	#		pkgs.gtk4-layer-shell
	#	];
	#};
}
