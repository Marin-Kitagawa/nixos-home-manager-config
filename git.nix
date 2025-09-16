{ config, pkgs, ... }:
{
  programs.git = {
      enable = true;
      package = pkgs.gitFull;
      userName = "Marin Kitagawa";
      userEmail = "49131888+Marin-Kitagawa@users.noreply.github.com";

      signing.key = "B0D4989052D02358";
#      signing.signByDefault = true;
      extraConfig = {
        # Sign all commits using ssh key
        commit.gpgsign = true;
#        gpg.format = "ssh";
#        user.signingkey = "./id_ed25519.pub";
#        gpg.ssh.allowedSignersFile = "./allowed_signers";
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
      includes = [
        {
          path = "~/.gitconfig-work";
          condition = "hasconfig:remote.*.url:git@github.com:q-rounds/**";
        }
      ];
    };
}
