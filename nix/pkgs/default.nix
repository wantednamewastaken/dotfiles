# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: rec {
  # example = pkgs.callPackage ./example { };
  sddm-themes = pkgs.callPackage ./sddm-themes { };
  sddm-sugar-dark = pkgs.callPackage ./sddm-sugar-dark { };
}
