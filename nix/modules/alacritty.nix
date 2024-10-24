{
  config,
  pkgs,
  home-manager,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    alacritty
    #helix.packages."${pkgs.system}".helix
  ];

  home-manager.users."ryan" = {
    programs.alacritty.enable = true;
    #programs.helix.package = helix.packages.${pkgs.system}.default;
    #home.file.".config/helix/config.toml".text = ''
    #  #keymap = "vim"
    #  theme = "onedark"
    #  
    #  [editor]
    #  line-number = "relative"

    #  [editor.whitespace]
    #  render = "all"
    #  #[editor.whitespace.render]
    #  #space = "all"
    #  #tab = "all"
    #  #[editor.whitespace.characters]
    #  #space = "."
    #  #nbsp = " "
    #'';
  };
}

#description = "First flake";

#    inputs = {
#        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
#        # home-manager = {
#        #     url = "github:nix-community/home-manager/release-24.05";
#        #     inputs.nixpkgs.follows = "nixpkgs";
#        # };
#        # Helix editor, master branch
#        #helix.url = "github:helix-editor/helix/master";
#    };

#      outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
#          nixosConfigurations = {
#              # Please replace hostname
#              server-nixos = nixpkgs.lib.nixosSystem {
#                  system = "x86_64-linux";
#                  # specialArgs = { inherit inputs; };
#                  specialArgs =  inputs;
#                  modules = [
#                      ./configuration.nix
#                      home-manager.nixosModules.home-manager
#                      {
#                          home-manager.useGlobalPkgs = true;
#                          home-manager.useUserPackages = true;
#  
#                          home-manager.users.ryan = import ./home.nix;
#                      }
#              ];
#          };
#        };
#      };
