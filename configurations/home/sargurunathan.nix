{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "sargurunathan";
    fullname = "Sargurunathan P";
    email = "sargurunathan.p@juspay.in";
  };

  home.stateVersion = "24.11";
}
