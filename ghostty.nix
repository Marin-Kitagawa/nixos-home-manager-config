{ config, lib, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      keybindings = {
        "ctrl+shift+left" = "unbind";
        "ctrl+shift+right" = "unbind";
      };
    };
  };
}
