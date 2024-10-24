{
  description = "Please work";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix/master";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      helix,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs;
      lib = nixpkgs.lib;
    in
    {
      homeConfigurations = {
        "ryan" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          #pkgs = import nixpkgs { system = system; };
          modules = [ ./home.nix ];
          extraSpecialArgs = {
            username = "ryan";
            inherit inputs;
          };
        };

        #"ashley" = home-manager.lib.homeManagerConfiguration {
        #  inherit pkgs;
        #  #pkgs = import nixpkgs { system = system; };
        #  modules = [
        #    ./ashley/home.nix
        #  ];
        #  extraSpecialArgs = {
        #    username = "ashley";
        #    inherit inputs;
        #  };
        #};

        #import ./home-conf.nix {
      };
      #homeConfigurations."server-nixos" = import ./home-conf.nix {
      #  #import ./home-conf.nix {
      #    inherit inputs system nixpkgs home-manager;
      #    specialArgs = inputs;
      #    ];
      #    extraSpecialArgs = {
      #      helix-master = helix;
      #    };
      #};

      nixosConfigurations = {
        "server-nixos" = lib.nixosSystem {
          specialArgs = {
            inherit inputs helix;
          };
          inherit system;
          #pkgs = import nixpkgs home-manager { system = system; };
          modules = [
            ./configuration.nix
            ./modules/podman.nix
            ./modules/helix.nix
            ./modules/server-hdd.nix
            ./modules/sops.nix
            ./modules/python.nix
            #./alacritty.nix
            #./picom.nix
            #sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ryan = import ./ryan/home.nix;
              #home-manager.extraSpecialArgs = [
              #    import nixpkgs
              #];
            }
          ];
        };

        "nixos-i3" = lib.nixosSystem {
          specialArgs = {
            inherit  helix;
          };
          inherit system;
          #pkgs = import nixpkgs home-manager { system = system; };
          modules = [
            ./configuration.nix
            #./podman.nix
            #./alacritty.nix
            #sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ryan = import ./home.nix;
              #home-manager.users.username = import "./{$username}/home.nix";
            }
          ];
        };
      };

      # nixosConfigurations = import ./configuration.nix {
      #     inherit (nixpkgs) pkgs lib config;
      #     inherit inputs system;
      # };
    };
}
