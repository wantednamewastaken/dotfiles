{
  pkgs,
  inputs,
  config,
  ...
}:
{

  imports = [ inputs.sops-nix.nixosModules.sops ];

  environment.systemPackages = with pkgs; [ sops ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/ryan/.config/sops/age/keys.txt";

  sops.secrets = {
    example_key = { };
    "myservice/sub/my_secret" = {
      #owner = "sometest";
    };
  };

  #systemd.services."sometest" = {
  #	script = ''
  #		echo thing
  #	'';
  #	serviceConfig = {
  #		User = "sometest";
  #		WorkingDirectory = "/var/lib/sometest";
  #	};

  #	users.users.sometest = {
  #		home = "/var/lib/sometest";
  #		createHome = true;
  #		isSystemUser = true;
  #		group = "sometest";
  #	};
  #	users.groups.sometest = { };
  #};
}