{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    fonts = {
      fixedWidth = {
        family = "FiraCode Nerd Font";
        pointSize = 11;
      };
      general = {
        family = "Work Sans";
        pointSize = 11;
      };
    };

    krunner = {
      position = "center";
    };
    kscreenlocker = {
      appearance = {
        wallpaperPictureOfTheDay = {
          provider = "epod";
          updateOverMeteredConnection = true;
        };
      };
    };
    kwin = {
      effects = {
        dimAdminMode = {
          enable = true;
        };
        dimInactive = {
          enable = true;
        };
        minimization = {
          animation = "magiclamp";
        };
        translucency = {
          enable = true;
        };
        wobblyWindows = {
          enable = true;
        };
      };
    };
    workspace = {
    };
  };
}
