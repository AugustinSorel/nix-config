{ config, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "personal_server" = {
        user = "root";
        hostname = "188.245.37.45";
        identityFile = config.sops.secrets."personal_server/key".path;
      };

      "github.com" = {
        user = "git";
        identityFile = config.sops.secrets."github/key".path;
      };
    };
  };
}
