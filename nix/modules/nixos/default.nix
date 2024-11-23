# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
#{ pkgs, config, lib, ... }:
{
  #inputs,
  #outputs,
  #lib,
  #config,
  #pkgs,
	#nixpkgs-unstable,
  ...
}:
{
  # List your module files here
  # my-module = import ./my-module.nix;
	#SpecialArgs = { inherit inputs pkgs outputs; };
  imports = [
		#./desktop-environments/i3.nix
		./desktop-environments/hyprland.nix
		#./../../pkgs
		#./desktop-environments/cinnamon.nix
		#./desktop-environments/kde.nix
		] ++ [ # Essentials/Basics
    ./qt.nix
		./server-hdd.nix
    ./application-defaults.nix
		#outputs.sops-nix.nixosModules.sops
    #./sops.nix
    ./python.nix
		] ++ [
    ./podman.nix
    ./helix.nix
    ./mpd.nix
    #./alacritty.nix
    #./picom.nix
  ];
}
