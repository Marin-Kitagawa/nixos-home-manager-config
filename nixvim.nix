{
  programs.nixvim = {
    enable = true;
    colorschemes = {
      onedark = {
        enable = true;
      };
    };
    clipboard = {
      providers = {
        wl-copy = {
	  enable = true;
	};
      };
    };
  };
}
