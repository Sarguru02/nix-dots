# Top-level flake glue to get our configuration working
{ inputs, ... }:

{
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];
  perSystem = { self', pkgs, ... }: {
    # For 'nix fmt'
    formatter = pkgs.nixpkgs-fmt;

    # Enables 'nix run' to activate.
    packages.default = self'.packages.activate;

    packages.vopener = pkgs.writeShellApplication{
      name = "vopener";
      runtimeInputs = with pkgs; [tmux];
      text = builtins.readFile ../../scripts/vopener;
    };

    packages.zmx = pkgs.stdenvNoCC.mkDerivation {
      pname = "zmx";
      version = "0.5.0";
      src = pkgs.fetchzip {
        url = "https://zmx.sh/a/zmx-0.5.0-linux-x86_64.tar.gz";
        hash = "sha256-tn5bQUA53gi4fZiI2nNSYrJcZP6TvvecDIvsMtcHWKg=";
      };
      dontBuild = true;
      installPhase = ''
        mkdir -p $out/bin
        cp zmx $out/bin/zmx
        chmod +x $out/bin/zmx
      '';
    };

    packages.zmx-select = pkgs.writeShellApplication {
      name = "zmx-select";
      runtimeInputs = [self'.packages.zmx] ++ (with pkgs; [fzf]);
      text = builtins.readFile ../../scripts/zmx-select;
    };

    packages.jclaude = pkgs.writeShellApplication {
      name = "jclaude";
      runtimeInputs = with pkgs; [
        inputs.claude-code-nix.packages.${system}.claude-code
        fzf
        curl
        jq
      ];
      text = builtins.readFile ../../scripts/jclaude;
    };
  };
}
