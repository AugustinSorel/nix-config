{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      export EDITOR="hx"
    '';
  };
}
