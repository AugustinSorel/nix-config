{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "sorelaugustin@gmail.com";
    userName = "augustinSorel";
  };
}
