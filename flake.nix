{
  description = "Irelia's Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #    nixvim = {
    #      url = "github:elythh/nixvim";
    #    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # zen-browser = {
    #   url = "github:Marin-Kitagawa/zen-browser-flake";
    #   inputs = {
    #     # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
    #     nixpkgs.follows = "nixpkgs-unstable";
    #     home-manager.follows = "home-manager";
    #   };
    # };
    #
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      nixvim,
      plasma-manager,
      zen-browser,
    }@inputs:
    let
      username = "irelia";
      system = "x86_64-linux";
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [
          plasma-manager.homeModules.plasma-manager
          #nixvim.homeModules.nixvim
          #zen-browser.homeModules.twilight-official
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
}
