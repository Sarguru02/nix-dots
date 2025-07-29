{
  plugins.mini = {
    enable = true;
  };

  imports = [
    ./ai.nix
    ./pairs.nix
    ./surround.nix
    ./statusline.nix
  ];
}
