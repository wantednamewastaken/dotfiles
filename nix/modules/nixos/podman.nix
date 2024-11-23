{
  #config,
  pkgs,
  #lib,
  #home-manager,
  ...
}:
{
  # thing.thing.this = true;
  # nix.gc = {
  #   automatic = lib.mkForce true;
  #   dates =  lib.mkForce "weekly";
  # };
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a 'docker' alias for podman, to use it as a drop-in replacement
      dockerCompat = false;
      # Required for containers under podman-compose to be able to talke to each other.
      defaultNetwork.settings.dns_enabled = true;
      dockerSocket.enable = true;

      #networkSocket.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman
    dive
    podman-tui
    podman-compose
    #helix.packages."${pkgs.system}".helix
  ];

  #home-manager.users."ryan" = {
  #    programs.helix.enable = true;
  #    #programs.helix.package = helix.packages.${pkgs.system}.default;
  #    home.file.".config/helix/config.toml".text = ''
  #      keymap = "vim";
  #      themes = ["dark"];
  #      # Additional configurations can be added here
  #    '';
  #};
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
