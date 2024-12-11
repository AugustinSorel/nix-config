{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    keyMode = "vi";
    clock24 = true;
    extraConfig = ''
      # bind v to begin-selection
      bind -T copy-mode-vi v send -X begin-selection

      # bind y to yank
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel wl-copy
    '';
  };
}
