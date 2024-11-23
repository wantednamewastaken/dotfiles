{
  config,
  pkgs,
  helix,
  inputs,
  home-manager,
  ...
}: {
		fileSystems."/mnt/server-hdd" = {
			device = "ryan@10.0.0.26:/mnt/md0";
			fsType = "sshfs";
			options = [
				"auto"
				"x-systemd.automount"
				"_netdev"
				"reconnect"
				"allow_other"
				"IdentityFile=/home/ryan/.ssh/server-ecdsa"
				"default_permissions"
			];
		};

		boot.supportedFilesystems."fuse.sshfs" = true;
		boot.supportedFilesystems."sshfs" = true;

    # imports = [
    #     inputs.home-manager.nixosModules.home-manager
    # ];

    #environment.systemPackages = with pkgs; [
    #    helix
    #    #helix.packages."${pkgs.system}".helix
    #];

    #programs.helix.enable = true;

    #home-manager.users."ryan" = {
    #    programs.helix.enable = true;
    #    #programs.helix.package = helix.packages.${pkgs.system}.default;
    #    home.file.".config/helix/config.toml".text = ''
    #      #keymap = "vim"
}

