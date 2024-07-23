{ config, pkgs, ... }:
let
  sources = ./nix/sources.nix
in {
   xdg.configFile = {
      nvim = {
        onChange = "nvim --headless -c 'if exists(\":LuaCacheClear\") | :LuaCacheClear' +quitall";
        source = sources.astronvim;
      };
   };
}
