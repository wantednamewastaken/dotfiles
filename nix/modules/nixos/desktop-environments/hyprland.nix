{
  #config,
  pkgs,
	system,
	stdenv,
  lib,
	inputs,
	outputs,
  ...
}:
{
	#SpecialArgs = { inherit inputs pkgs outputs; };
	imports = [
		./../themes
		./../themes/ags.nix
		# BROKEN #./themes/sddm.nix {inherit stdenv pkgs system;}
	];

	programs.hyprlock.enable = true;
	programs.hyprland = {
		enable = true;
		#nvidiaPatches = true;
		xwayland.enable = true;
	};

	services = {
		xserver.displayManager.lightdm = {
			enable = false;
			greeter.enable = false;
			#background = /home/ryan/pictures/wallpapers/0001.jpg;
		};
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			#theme = "elarun";
			theme = "Elegant";
			package = pkgs.kdePackages.sddm;
			# FIXME: Nothing with sddm themeing works.
			#settings = {
			#	General = {
			#		ForceHideCompletePassword=true;
			#	};
			#};
			autoNumlock = true;
		};
	};
	environment.etc."/sddm/themes/ml4w/sddm.conf".source = "/home/ryan/dotfiles/local/sddm/sddm.conf";
	environment.etc."/sddm/themes/ml4w/theme.conf".source = "/home/ryan/dotfiles/local/sddm/theme.conf";
	#environment.etc."sddm.conf".text = lib.mkForce ''
	#[General]
	#ForceHideCompletePassword=true'';
	#writeTextFile = {
	#	name = "sddm.conf";
	#	destination = /run/current-system/sw/share/sddm/themes/ml4w;
	#	text = (builtins.readFile /home/ryan/gitclones/dotfiles/share/sddm/sddm.conf);
	#};
	#symlinkJoin {
	#	name = "sddm.conf";
	#	destination = /run/current-system/sw/share/sddm/themes/ml4w;
	#	text = (builtins.readFile /home/ryan/gitclones/dotfiles/share/sddm/sddm.conf);
	#};

  environment.systemPackages = with pkgs; [
		kitty
		waybar
		swaynotificationcenter
		hyprshot
		brightnessctl
		libsForQt5.qt5.qtgraphicaleffects
		sddm
		unstable.catppuccin-sddm
		unstable.catppuccin-sddm-corners
		unstable.elegant-sddm
		unstable.sddm-sugar-dark
		#(unstable.sddm-sugar-dark.overrideAttrs (oldAttrs: {
		#	extraConfig = oldAttrs.extraConfig ++ {
		#		ForceHideCompletePassword="true"; };
		#	})
		#)
		] ++ [
		pavucontrol
		gnome.dconf-editor
		loupe
		gnome.gnome-calculator
		gnome.gnome-system-monitor
		unstable.noto-fonts
		unstable.font-awesome
		unstable.fira-sans
		unstable.fira-code-symbols
		#ttf-firacode-nerd
		] ++ [
		#eww
		hyprlock
		hyprshade
		swayidle
		pywal
		gum
		wlogout
		imagemagick
		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
		] ++ [ # Notification stuff
		libnotify
		#dunst
		#mako
		] ++ [ # Wallpaper
		hyprpaper
		#swaybg
		#wpaperd
		#mpvpaper
		swww
		] ++ [ # Rofi
		rofi-wayland
		# gtk rofi
		#wofi
		# hyperland wiki also suggests
		#bemenu
		#fuzzel
		#tofi
  ];

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};
	#environment.sessionVariables = {
	#	# If your cursor becomes invisible
	#	WLR_NO_HARDWARE_CURSORS = "1";
	#	# Hinst electron apps to use wayland
	#	NIXOS_OZONE_WL = "1";
	#};

	#hardware = {
	#	opengl.enable = true;
	#	# Most wayland compositors need this
	#	nvidia.modesetting.enable = true;
	#};
	home-manager.verbose = true;
	home-manager.users.ryan = {
		dconf = {
			enable = true;
			#settings = {
			#	"org/cinnamon/theme" = {
			#		name = "Tokyonight-Dark-B";
			#	};
			#	"org/cinnamon/desktop/interface" = {
			#		gtk-theme = "Tokyonight-Dark-B";
			#		#font-name = "";
			#		icon-theme = "candy-icons";
			#		cursor-theme = "Vimix-white-cursors";
			#		#cursor-size = 10;
			#		#scaling-factor = ;
			#		#text-scaling-factor = ;
			#		clock-show-seconds = lib.mkDefault false;
			#		clock-show-date = lib.mkDefault true;
			#		clock-use-24h = lib.mkDefault false;

			#	};
			#	"org/cinnamon/desktop/screensaver" = {
			#		lock-delay = lib.gvariant.mkUint32 5;
			#	#	#font-date = ;
			#	#	#font-time = ;
			#	#	#font-message =;
			#	};
			#};
		};
		gtk = {
			enable = true;
			theme = {
				package = pkgs.tokyonight-gtk-theme;
				name = "Tokyonight-Dark-B";
			};
			iconTheme = {
				package = pkgs.candy-icons;
				name = "candy-icons";
			};
			#cursorTheme = {
			#	package = pkgs.vimix-cursors;
			#	name = "Vimix-white-cursors";
			#	#size = ;
			#};
			#font = {
			#	#package = "";
			#	#name = "";
			#	#size = ;
			#};
			gtk3 = {
				extraConfig = {
					gtk-application-prefer-dark-theme=false;
				};
			};
			gtk4 = {
				extraConfig = {
					gtk-application-prefer-dark-theme=false;
					#gtk-theme-name="Adwaita";
					#gtk-icon-theme-name="Papirus-Dark";
					gtk-font-name="Cantarell 11";
					#gtk-cursor-theme-name="Bibata-Modern-Ice";
					gtk-cursor-theme-size=24;
					gtk-toolbar-style="GTK_TOOLBAR_ICONS";
					gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR";
					gtk-button-images=0;
					gtk-menu-images=0;
					gtk-enable-event-sounds=1;
					gtk-enable-input-feedback-sounds=0;
					gtk-xft-antialias=1;
					gtk-xft-hinting=1;
					gtk-xft-hintstyle="hintslight";
					gtk-xft-rgba="rgb";
				};
			};
		};
	};
}
