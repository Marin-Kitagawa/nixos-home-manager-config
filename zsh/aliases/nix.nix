{
  programs.zsh.shellAliases = {
    clean-os = "nh clean all";
    fnf = "git ls-files '*.nix' | xargs -r nix run nixpkgs#alejandra --"; # Format Nix Files
    nix-store-repair = "sudo nix-store --repair --verify --check-contents";
    rip = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl";
    riplong = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl";
    updatehm = "nix flake update; export NIXPKGS_ALLOW_UNFREE=1; home-manager switch --flake . --impure";
    updatenix = "sudo nix flake update; sudo nixos-rebuild switch --upgrade --flake . --impure --show-trace -L -vvv";
  };
}
