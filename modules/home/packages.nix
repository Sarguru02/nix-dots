{ flake, pkgs, ... }:
let
  inherit (pkgs) lib;
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    omnix

    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    gnumake

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt


    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    less

    #these are done by me
    zsh-powerlevel10k
    tmux
    flake.self.packages.${system}.vopener
    ledger
    flake.inputs.my-nvim.packages.${system}.default
    delta
    just
    flake.self.packages.${system}.jclaude

    signal-desktop
  ]
  # macOS-only packages
  ++ lib.optional isDarwin vlc-bin-universal
  ;

  programs = {
    # Better `cat`
    bat.enable = true;
    fzf.enable = true;
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
    # Tmate terminal sharing.
    tmate = {
      enable = true;
      #host = ""; #In case you wish to use a server other than tmate.io 
    };
  };
}
