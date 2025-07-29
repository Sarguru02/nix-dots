{
  plugins.snacks = {
    enable = true;
  };

  imports = [
    ./lazygit.nix
    ./picker.nix
    ./dashboard.nix
  ];
}
