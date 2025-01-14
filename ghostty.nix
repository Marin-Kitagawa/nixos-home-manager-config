{}:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    InstallBatSyntax = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      keybindings = {
        "ctrl+shift+left" = "unbind";
        "ctrl+shift+right" = "unbind";
      }
    }
  }
}
