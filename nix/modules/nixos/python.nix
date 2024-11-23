{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    python3
    (python3.withPackages (
      ps: with ps; [
        python-lsp-server
        python-lsp-jsonrpc
        python-lsp-black
        python-lsp-ruff
        pyls-isort
        pyls-flake8
        flake8
        isort
        black
      ]
    ))
  ];
}
