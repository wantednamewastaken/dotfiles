# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  #nixpkgs-unstable,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      (self: super: {
        neovim = super.unstable.neovim;
        #--version = "latest";
      })
      (self: super: { btop = super.unstable.pkgs.btop; })
      (self: super: { freetube = super.unstable.freetube; })
      (self: super: { wezterm = super.unstable.wezterm; })

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      pulseaudio = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
        auto-optimise-store = true;
      };
      gc = {
        automatic = lib.mkDefault true;
        dates = lib.mkDefault "weekly";
        options = lib.mkDefault "--delete-older-than 7d";
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      # Old before config nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    };
  #homeDir = "${config.home.homeDirectory}";
  #stuffDir =
  #    if isLinux then "/stuff" else
  #    if isDarwin then "${homeDir}/stuff" else unsupported;

  #		options = {
  #			thing.thing.this = lib.mkOption {
  #				type = lib.types.bool;
  #				default = false;
  #			};
  #		};

  #config = {
  #thing.thing.this = false;
  # paste your boot config here...
  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";
  # boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 15;

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };

    # TODO: Set your hostname
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
      LC_CTYPE = "en_US.UTF-8"; # required by dmenu don't change this
    };
  };
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

  sound.enable = true;

  services = {
    # Stupid naming convention, some xserver options used in hyprland(displayManager) and others not (xkb.*).
    xserver = {
      xkb.layout = "us";
      xkb.variant = "";
      xkb.options = "ctrl:nocaps";
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      displayManager = lib.mkDefault {
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

    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      # TODO: Fix this
      extraConfig.pipewire = {
        "99-disable-bell" = {
          "context.properties" = {
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
    #};
    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      settings = {
        # Opinionated: forbid root login through SSH.
        PermitRootLogin = "no";
        # Opinionated: use keys only.
        # Remove if you want to SSH using passwords
        #PasswordAuthentication = false;
      };
    };

		openvpn.servers = {
			#defaultVPN = {
			#	#config = ''
			#	#adsfasdf
			#	#'';
			#	updateResolvConf = true;
			#};
		};

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };

  # Users defined
  users.users.ryan = {
    isNormalUser = true;
    description = "ryan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
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

  environment.systemPackages =
    with pkgs;
    [
      brave
      dmenu
      git
      gnome.gnome-keyring
      unstable.font-awesome
      (unstable.nerdfonts.override {
        fonts = [
          "Hack"
          "FiraCode"
          "DroidSansMono"
          "Meslo"
        ];
      })
      networkmanagerapplet
      nitrogen
			openvpn
      killall
      arandr
      pasystray
      nix-du
      playerctl
      inotify-tools
      inxi
      polkit_gnome
      pulseaudioFull
      rofi
      feh
      p7zip
      lxappearance
		] ++ [
      file
      tldr
      tree
      unrar
			htop
      xclip
      unzip
      wezterm
      neovim
    ]
    ++ [
      # Nix formatting stuff
      #nixfmt-unstable # nixfmt-rfc-style
      alejandra
      nixd
    ]
    ++ [
      librewolf
      #(lua.override {
      #	version = "5.1";
      #})
      lua
      #lua5_1
      lua51Packages.luarocks
      lua51Packages.lua
      nodejs_18
      luarocks
      cargo
      freetube
      nodejs
      ocaml
    ] # ++ lib.optionals isLinux [
    ++ [
      # Linux CLI Tools
      ranger
      btop
      zoxide
      fish
      eza
      ripgrep
      ncdu
      fd
      stress
      tmux
      fzf
      #inputs.helix.packages."${pkgs.system}".helix
      pyenv
      direnv
      nix-direnv
    ]
    ++ [
      # Zsh
      zsh
      oh-my-zsh
      zsh-powerlevel10k
      fzf-zsh
    ];

  # Add Zsh to the valid shells
  environment.shells = [ pkgs.zsh ];

  programs = {
    thunar.enable = true;
    # home-manager.enable = true;
    dconf.enable = true;
		ssh.startAgent = true;

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
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  # Don't touch this
  system.stateVersion = "24.05";
}
