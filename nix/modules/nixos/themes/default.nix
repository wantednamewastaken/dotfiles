{
	#config,
	pkgs,
	...
}:
{
	imports = [
		#./themes
	];

  environment.systemPackages = with pkgs; [
		vimix-cursors
		candy-icons
  ];
}
