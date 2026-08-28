{ config, ... }:

{
  programs.opencode = {
    enable = true;

    settings = {
      autoupdate = false;

      provider = {
        custom_claude_azure = {
          npm = "@ai-sdk/anthropic";
          name = "claude (Azure)";
          options = {
            baseURL = "https://servier-difa-foundry-nprd.services.ai.azure.com/anthropic/v1/";
            apiKey = "{file:${config.sops.secrets."azure_ai_foundry/key".path}}";
          };
          models = {
            "claude-sonnet-4-6" = {
              name = "claude-sonnet-4-6";
            };
          };
        };
      };
    };
  };
}
