{
  #config,
  pkgs,
  #lib,
  ...
}:
{
  #environment.systemPackages = with pkgs; [
  #];

	services = {
		xserver = {
			windowManager = {
				i3 = {
					enable = true;
					extraPackages = with pkgs; [ 
						i3status
						polybar
						picom
						dunst
					];
				};
			};
		};

		displayManager.defaultSession = "xfce+i3";
	};
}
