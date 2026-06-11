{ ... }:

{
  programs.helium = {
    enable = true;
    policies = {
      "BookmarkBarEnabled" = false;
      "ExtensionInstallForcelist" = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
        "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
        "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      ];
    };
  };
}
