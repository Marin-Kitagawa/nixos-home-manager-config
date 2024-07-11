{ config, pkgs, ... }:
{
  programs.git = {
      enable = true;
      package = pkgs.gitFull;
      userName = "Marin Kitagawa";
      userEmail = "49131888+Marin-Kitagawa@users.noreply.github.com";

#      signing.key = "6672A884D16B460F";
#      signing.signByDefault = true;
      extraConfig = {
        # Sign all commits using ssh key
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
        credential.helper = "libsecret";

        #git-delta configuration
        core = { pager = "delta"; };
        interactive = { diffFilter = "delta --color-only"; };
        delta = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
          true-color = "always";
        };
        merge = { conflictstyle = "diff3"; };
        diff = { colorMoved = "default"; };
      };
    };
}
