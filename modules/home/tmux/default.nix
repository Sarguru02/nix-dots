{ pkgs, ... }:
{
  # --- Enable tmux itself ---
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";

    # Let Home Manager handle tmux plugins (no TPM)
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      tmux-fzf
      tmux-nova
    ];
    extraConfig = ''
      set-option -g default-shell "${pkgs.zsh}/bin/zsh"
      set-option -g default-command "${pkgs.zsh}/bin/zsh -l"
    '';

  };

  # --- Place your tmux config files in XDG_CONFIG_HOME ---
  xdg.configFile = {
    "tmux/tmux.conf".text =  builtins.replaceStrings
    [ "\${pkgs.tmuxPlugins.tmux-fzf}" ]
    [ "${pkgs.tmuxPlugins.tmux-fzf}" ]
    (builtins.readFile ./tmux.conf);
    "tmux/theme.tmux".source = ./theme.tmux;
    "tmux/navigator.tmux".source = ./navigator.tmux;
  };
}
