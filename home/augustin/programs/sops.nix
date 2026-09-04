{ config, ... }:

{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "personal_server/key" = {
        path = "${config.home.homeDirectory}/.ssh/personal_server_key";
      };

      "github/key" = {
        path = "${config.home.homeDirectory}/.ssh/github_personal_key";
      };

      "azure_ai_foundry/key" = { };
    };
  };

}
