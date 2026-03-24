{ config, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      ignores = [ "*~" "*.swp" ];
      settings = {
        user = {
          email = config.me.email;
          name = config.me.fullname;
        };
        alias = {
          ci = "commit";
        };
        init.defaultBranch = "master";
      };
    };
    lazygit = {
      enable = true;
      settings = {
        git.pagers = [ {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        } ];
      };
    };
  };
}
