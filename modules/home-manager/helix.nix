{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "onelight";

      editor = {
        line-number = "relative";
        bufferline = "always";
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "error";
        };
      };

      keys.normal = {
        C-h = "select_prev_sibling";
        C-j = "shrink_selection";
        C-k = "expand_selection";
        C-l = "select_next_sibling";
      };
    };

    languages = {
      language = [{
        name = "toml";
        auto-format = true;
        formatter = {
          command = "taplo";
          args = [ "fmt" "-" ];
        };
      }

        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixpkgs-fmt";
          };
        }

        {
          name = "typescript";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "tailwindcss-ls"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "typescript" ];
          };
        }

        {
          name = "tsx";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "tailwindcss-ls"
            "emmet-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "typescript" ];
          };
        }

        {
          name = "jsx";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "tailwindcss-ls"
            "emmet-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "javascript" ];
          };
        }

        {
          name = "javascript";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "tailwindcss-ls"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "typescript" ];
          };
        }

        {
          name = "json";
          auto-format = true;
          language-servers = [
            "vscode-json-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "json" ];
          };
        }


        {
          name = "html";
          auto-format = true;
          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-ls"
            "emmet-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "html" ];
          };
        }

        {
          name = "css";
          auto-format = true;
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-ls"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "css" ];
          };
        }

        {
          name = "yaml";
          auto-format = true;
          language-servers = [
            "yaml-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "yaml" ];
          };
        }

        {
          name = "dockerfile";
          auto-format = true;
          language-servers = [
            "docker-langserver"
          ];
        }

        {
          name = "docker-compose";
          auto-format = true;
          language-servers = [
            "docker-compose-langserver"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "yaml" ];
          };
        }

        {
          name = "markdown";
          auto-format = true;
          language-servers = [
            "marksman"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "markdown" ];
          };
        }];

      language-server.tailwindcss-ls = {
        command = "tailwindcss-language-server";
        args = [ "--stdio" ];
      };

      language-server.emmet-language-server = {
        command = "emmet-language-server";
        args = [ "--stdio" ];
      };

      language-server.yaml-language-server.config.yaml = {
        format = { enable = true; };
        validation = true;
      };

      language-server.yaml-language-server.config.yaml.schemas = {
        "https://json.schemastore.org/github-workflow.json" = ".github/workflows/*.{yml,yaml}";
        "https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json" = "roles/{tasks,handlers}/*.{yml,yaml}";
      };
    };
  };

}
