{pkgs, ... }:
{
  home.shellAliases = {
    x = "exit";
    c = "clear";
    v = "nvim";
    cl = "clear && ls";
    rvo = ''ssh -t sargurunathan@tcpu "zsh -i -c \"vo; zsh\""'';
    vo = "vopener";
  };

  home.file.".p10k.zsh" = {
    text = builtins.readFile ./p10k.zsh;
    force = true;
  };
  programs = {
    # on macOS, you probably don't need this
    zsh = {
      enable = true;
      oh-my-zsh= {
        enable = true;
        plugins = ["git" "vi-mode"];
        custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
        theme = "powerlevel10k";
      };

      initContent = ''
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      '';
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      envExtra = ''
        export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
        export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
        export EDITOR=nvim
      '';
      profileExtra = ''
        if [ -z "$SSH_AUTH_SOCK" ]; then
            exec ssh-agent zsh
        fi
      '';
    };
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
  };
}
