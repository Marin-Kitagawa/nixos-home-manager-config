{
  config,
  pkgs,
  ...
}: let
  sources = import ./nix/sources.nix;
in {
  xdg.configFile = {
    nvim = {
      onChange = "nvim --headless -c 'if exists(\":LuaCacheClear\") | :LuaCacheClear' +quitall";
      source = sources.AstroNvim;
    };
  };
}
