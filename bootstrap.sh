rm -rf ~/.config/home-manager/home.nix
for i in $(\ls *.nix)
do
  ln ~/github/nixos-home-manager-config/$i ~/.config/home-manager/$i
done

