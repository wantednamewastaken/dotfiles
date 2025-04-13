{
  #config,
  pkgs,
  lib,
  ...
}:
{
	imports = [
		../themes #{inherit pkgs;}
	];

  environment.systemPackages = with pkgs; [
		gettext
		#cinnamon-gsettings-overrides
		gdm
		dconf-editor
		gnomeExtensions.settingscenter
		gnome.nixos-gsettings-overrides
		gnome-tweaks
		gnome-system-monitor
		] ++ [ # Theme stuff
		tokyonight-gtk-theme
		orchis-theme
		#pop-gtk-theme
		#adapta-gtk-theme
		] ++ [
		yakuake
  ];

	services.dbus.packages = [
		pkgs.libsForQt5.kglobalaccel
	];

	hardware.pulseaudio.enable = false;
	programs.dconf.enable = true;

	home-manager.users.ryan = {
		dconf = {
			enable = true;
			settings = {
				"org/cinnamon" = {
					panels-height = ["1:44"];
					panel-zone-icon-sizes = ["{'panelId': 1, 'left': 0, 'center': 0, 'right': 24}"];
					panel-zone-symbolic-icon-sizes = ["{'panelId': 1, 'left': 30, 'center': 28, 'right': 16}"];
				};
				"org/cinnamon/desktop/background" = {
					picture-uri = "file:///home/ryan/pictures/wallpapers/0015.jpg";
					#picture-uri-dark = "file:///home/ryan/pictures/wallpapers/0015.jpg";
				};
				"org/cinnamon/theme" = {
					name = "Tokyonight-Dark-B";
				};
				"org/cinnamon/desktop/interface" = {
					gtk-theme = "Tokyonight-Dark-B";
					#font-name = "";
					icon-theme = "candy-icons";
					cursor-theme = "Vimix-white-cursors";
					#cursor-size = 10;
					#scaling-factor = ;
					#text-scaling-factor = ;
					clock-show-seconds = lib.mkDefault false;
					clock-show-date = lib.mkDefault true;
					clock-use-24h = lib.mkDefault false;

				};
				"org/cinnamon/desktop/screensaver" = {
					lock-delay = lib.gvariant.mkUint32 5;
				#	#font-date = ;
				#	#font-time = ;
				#	#font-message =;
				};
				"org/cinnamon/desktop/session" = {
					idle-delay = lib.gvariant.mkUint32 120;
				};
				# TODO: keybinds not working, don't think binding issue
				"org/cinnamon/desktop/keybindings/custom-keybindings/custom0" = {
					binding = ["<Super>Return"];
					command = "wezterm";
					name = "open-terminal";
				};
				"org/cinnamon/desktop/keybindings/custom-keybindings/custom1" = {
					binding = ["<Primary><Shift>Escape"];
					command = "gnome-system-monitor";
					name = "task manager";
				};
			};
		};

		#gtk = {
		#	enable = true;
		#	theme = {
		#		package = pkgs.tokyonight-gtk-theme;
		#		name = "Tokyonight-Dark-B";
		#	};
		#	iconTheme = {
		#		package = pkgs.candy-icons;
		#		name = "candy-icons";
		#	};
		#	cursorTheme = {
		#		package = pkgs.vimix-cursors;
		#		name = "Vimix-white-cursors";
		#		#size = ;
		#	};
		#	#font = {
		#	#	#package = "";
		#	#	#name = "";
		#	#	#size = ;
		#	#};
		#	gtk3 = {
		#		extraConfig.gtk-application-prefer-dark-theme = true;
		#	};
		#};
	};


	services = {
		cinnamon.apps.enable = true;
		xserver = {
			desktopManager = {
				cinnamon = {
					enable = true;
					#sessionPath = "";
					#extraGSettingsOverrides = ''
					#	[org.cinnamon.desktop.background]
					#	picture-uri 'file:///home/ryan/pictures/wallpapers/0013.jpg'
					#'';
				};
			};
		};
	};
}
