{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    zsh-powerlevel10k
    zsh-nix-shell
    zsh-vi-mode
    zsh-autocomplete
    zsh-syntax-highlighting
    zsh-you-should-use
    bat
    glow

    lsof
    ltrace
    strace

    # # Override needing all pkgs, select ones I want
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  fonts = {
    #fontconfig.enable = true;
    fontconfig.defaultFonts.monospace = "Hack Nerd Font Mono Regular 10";
    fontconfig.defaultFonts.sansSerif = "System San Francisco Display Regular 10";
    #fontconfig.defaultFonts.serif = "";
  };
  
  gtk = {
      enable = true;
      cursorTheme.name = "Vimex Cursors";
      cursorTheme.size = 16;
      iconTheme.name = "Win11-dark";
      theme.name = "Adwaita-dark";
    };


  home.file = {
    ".p10k.zsh".text = builtins.readFile /home/ryan/dotfiles/.p10k.zsh;
    ".zshrc".text = (builtins.readFile /home/ryan/dotfiles/.zshrc) + ''

        ##### Start of HM Automation #####
        export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
        # echo "${pkgs.zsh}"
        # echo "${pkgs.fzf}"
        source ~/dotfiles/zsh-syntax-highlighting-master/zsh-syntax-highlighting.sh
        alias e=eza
        alias ea="eza -la"
        alias hm="home-manager switch"

        # PS1="$/{PS1//\\u/"$SHLVL:\\u"/}"
    '';
    ".oh-my-zsh" = {
        source = /home/ryan/dotfiles/.oh-my-zsh;
        recursive = true;
    };
    # ".ssh/config".source = ~/dotfiles/ssh/config;
    # ".ssh/authorized_keys".text = (builtins.readFile ~/dotfiles/ssh/authorized_keys) + ''
    #     
    #     ##### Start of HM Automation #####
    # '';
    #".config/home-manager/home.nix".source = ~/dotfiles/config/i3/config;
    ".config/rofi" = {
        source = /home/ryan/dotfiles/config/rofi;
        recursive = true;
    };
    ".config/nvim" = {
        source = home/ryan/dotfiles/config/local/nvim;
        recursive = true;
    };
    ".tmux.conf".source = /home/ryan/dotfiles/.tmux.conf;
    ".tmux" = {
        source = /home/ryan/dotfiles/.tmux;
        recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/ryan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    wezterm = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        extraConfig = ''
          ${builtins.readFile /home/ryan/dotfiles/config/wezterm/wezterm.lua}
        '';
    };

    direnv = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };

    fzf.enableZshIntegration = true;
    zsh = {
        enable = true;
        # oh-my-zsh.enable = true;
        # oh-my-zsh.theme = "powerlevel10k";
        initExtra = ''
            source ~/dotfiles/.p10k.zsh;
        '';
        plugins = [
        # {
        #     name = "powerlevel10k-config";
        #     src = ~/dotfiles;
        #     file = ".p10k.zsh";
        # }
        {
            name = "zsh-powerlevel10k";
            src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
            file = "powerlevel10k.zsh-theme";
        }
        {
            name = "nix-shell";
            src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
        }
        # {
        #     name = "zsh-vi-mode";
        #     src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
        # }
        # {
        #     name = "zsh-autocomplete";
        #     src = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete";
        # }
        # {
        #     ### Might not be working
        #     name = "zsh-you-should-use";
        #     src = "${pkgs.zsh-you-should-use}/share/zsh-you-should-use";
        # }
        {
            name = "zsh-syntax-highlighting";
            src = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
        }
        ];
        syntaxHighlighting.enable = true;
    };
	
    git = {
	    enable = true;
	    userName = "wantednamewastaken";
	    userEmail = "ryandri@protonmail.com";
	    extraConfig = {
	    	    init.defaultBranch = "master";
	    };
    };

    # rofi = {
    #     enable = true;
    #     #font = "thing";
    #     #theme = "slate";
    #     plugins = with pkgs; [
    #         rofi-emoji
    #         rofi-calc
    #         rofi-power-menu
    #     ];

    #     extraConfig = {
    #         modi = "drun, filebrowser, window";
    #         show-icons = true;
    #         sort = true;
    #         matching = "fuzzy";
    #     };
    # };

    #programs.neovim = {
    #  enable = true;
    #  plugins = with pkgs.vimPlugins; [
    #    vim-sensible
    #    vim-airline
    #    vim-fugitive
    #  ];
    #};
  };
}
