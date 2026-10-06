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
            "claude-sonnet-5" = {
              name = "claude-sonnet-5";
            };
            "claude-sonnet-5-5" = {
              name = "claude-sonnet-5-5";
            };
            "claude-opus-5-5" = {
              name = "claude-opus-5-5";
            };
          };
        };

        custom_gpt_azure = {
          npm = "@ai-sdk/openai";
          name = "gpt (Azure)";
          options = {
            baseURL = "https://servier-difa-foundry-nprd.services.ai.azure.com/openai/v1/";
            apiKey = "{file:${config.sops.secrets."azure_ai_foundry/key".path}}";
          };
          models = {
            "gpt-5.6-sol" = {
              name = "gpt-5.6-sol";
            };
            "gpt-5.6-luna" = {
              name = "gpt-5.6-luna";
            };
            "gpt-6-astra" = {
              name = "gpt-6-astra";
            };
          };
        };
      };
    };
  };
}
