{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unified.url = "github:srid/nixos-unified";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.flake-parts.follows = "flake-parts";

    vertex.url = "github:juspay/vertex";

    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
  };

  outputs = inputs:
    inputs.nixos-unified.lib.mkFlake
      { inherit inputs; root = ./.; };
}
