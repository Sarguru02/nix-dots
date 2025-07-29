{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;

    settings = {
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };

    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
