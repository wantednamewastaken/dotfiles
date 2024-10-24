require("lspconfig").nixd.setup({
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
	nixos = {
            expr = '(builtins.getFlake "/home/ryan/dotfiles/nix/flake.nix").nixosConfigurations.server-nixos.options',
        },
        home_manager = {
            expr = '(builtins.getFlake "/home/ryan/dotfiles/nix/flake.nix").homeConfigurations.ryan.options',
        },
      },
    },
  },
})
