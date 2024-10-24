{ config, lib, pkgs, inputs, ... }:
let
    isLinux = pkgs.stdenv.hostPlatform.isLinux;
    isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
    unsupported = builtins.abort "Unsupported platform";

    #homeDir = "${config.home.homeDirectory}";
    #stuffDir =
    #    if isLinux then "/stuff" else
    #    if isDarwin then "${homeDir}/stuff" else unsupported;
in
with lib; {

  imports = [
    ./hardware-configuration.nix
  ];

  options = {
    thing.thing.this = mkOption {
        type = types.bool;
        default = false;
    };
  };

  config = {
    thing.thing.this = false;
    # paste your boot config here...
    # Bootloader.
    # boot.loader.grub.enable = true;
    # boot.loader.grub.device = "/dev/sda";
    # boot.loader.grub.useOSProber = true;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.systemd-boot.configurationLimit = 15;

    nix.gc = {
      # This is the 'with lib'
      automatic = mkDefault true;
      dates =  mkDefault "weekly";
      options = mkDefault "--delete-older-than 7d";
    };

    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    networking = {
      firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
      };

      hostName = "server-nixos";
      networkmanager.enable = true;
		}; 

    # edit as per your location and timezone
    time.timeZone = "America/Los_Angeles";
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LANGUAGE = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
        LC_CTYPE="en_US.UTF-8"; # required by dmenu don't change this
      };
    };
     i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
     ];

    sound.enable = true;

    services = {
        xserver = {
            xkb.layout = "us";
            xkb.variant = "";
            xkb.options = "ctrl:nocaps";
            enable = true;
            windowManager = {
                i3 = {
                    enable = true;
                    extraPackages = with pkgs; [
                        i3status
                    ];
                };
            };
            desktopManager = {
                xterm.enable = false;
                xfce = {
                    enable = true;
                    noDesktop = true;
                    enableXfwm = false;
                };
            };
            displayManager = {
                lightdm.enable = true;
                lightdm.greeter.enable = true;
                lightdm.background = /home/ryan/pictures/wallpapers/0001.jpg;
            };
        };
        picom = {
            enable = true;
            fade = true;
#   settings = {
      vSync = true;
#   backend = "xrender";     # or "gl" for screen tearing
#   settings = {
#       fading = {
#           backend = "xrender";    # or "gl" if you prefer
#            method = "linear";      # can be "linear", "cubic", etc.
#            time = 100;
#            # };
#        };
#   };
        };
        displayManager = {
            defaultSession = "xfce+i3";
        };

        gvfs.enable = true;
        gnome.gnome-keyring.enable = true;
        blueman.enable = true;
        pipewire = {
            enable = true;
            extraConfig.pipewire = {
                "99-disable-bell" = {
                    "context.properties"= {
                        "module.x11.bell" = false;
                    };
                };
            };
            alsa = {
                enable = true;
                support32Bit = true;
            };
            pulse.enable = true;
        };
          # List services that you want to enable:

          # Enable the OpenSSH daemon.
        openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
        pulseaudio = true;
      };
    };

    # Users defined
    users.users.ryan = {
      isNormalUser = true;
      description = "ryan";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "p@ssw0rd";
      shell = pkgs.zsh;
      # Ensure your .zshrc is sourced
      #home.file.".zshrc".source = /home/ryan/.zshrc;
      packages = with pkgs; [
        #brave
        xarchiver
      ];
    };
    #users.users.ashley = {
    #  isNormalUser = true;
    #  description = "ashley";
    #  extraGroups = [ "networkmanager" "wheel" ];
    #  initialPassword = "p@ssw0rd";
    #  shell = pkgs.zsh;
    #  packages = with pkgs; [
    #    #brave
    #    xarchiver
    #  ];
    #};


    environment.systemPackages = with pkgs; [
      brave
      dmenu
      git
      gnome.gnome-keyring
      # nerdfonts ########## FIX THIS just package select fonts
      (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" ]; })
      networkmanagerapplet
      nitrogen
      arandr
      pasystray
      nix-du
      playerctl
      inxi
      polybar
      picom
      polkit_gnome
      pulseaudioFull
      rofi
      feh
      p7zip
      lxappearance
      file
      tldr
      tree
      unrar
      xclip
      unzip
      wezterm
      neovim
      #### End of core pkgs
			] ++ [
			# Nix formatting stuff
			nixfmt-rfc-style
			alejandra
			nixd
      ] ++ [
      librewolf
      lua
      cargo
			freetube
      nodejs
      ocaml
      ] ++ lib.optionals isLinux [
      # CI Tools
      ranger
      btop
      zoxide
      eza
      ripgrep
      ncdu
      stress
      tmux
      fzf
      #inputs.helix.packages."${pkgs.system}".helix
      pyenv
      direnv
      nix-direnv
      ] ++ [
      # Zsh
      zsh
      oh-my-zsh
      zsh-powerlevel10k
      fzf-zsh

    ];

		nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    # Add Zsh to the valid shells
    environment.shells = [ pkgs.zsh ];

    programs = {
        thunar.enable = true;
        # home-manager.enable = true;
        dconf.enable = true;

        zsh = {
        	enable = true;
      	# ohMyZsh.enable = true;
      	# ohMyZsh.plugins = [
      	# 	"git"
      	# 	"docker"
      	# ];
      };
    };

    security = {
      polkit.enable = true;
      rtkit.enable = true;
    };

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart =
            "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
    
    hardware = {
      bluetooth.enable = true;
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };


    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    
    # Don't touch this
    system.stateVersion = "24.05";
  };
}
