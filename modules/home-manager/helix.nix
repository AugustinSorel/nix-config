{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";

      editor = {
        line-number = "relative";
        bufferline = "always";
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
            "vscode-eslint-language-server"
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
            "vscode-eslint-language-server"
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
            "vscode-eslint-language-server"
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
            "vscode-eslint-language-server"
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "javascript" ];
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
        }];

      language-server.tailwindcss-ls = {
        command = "tailwindcss-language-server";
        args = [ "--stdio" ];
      };

      language-server.emmet-language-server = {
        command = "emmet-language-server";
        args = [ "--stdio" ];
      };
    };
  };

}
