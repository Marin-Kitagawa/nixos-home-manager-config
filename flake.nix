{
  description = "Irelia's Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager }: 
  let 
    username = "irelia";
    system = "x86_64-linux";
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        plasma-manager.homeManagerModules.plasma-manager
        ./home.nix
      ];
    };
  };
}
