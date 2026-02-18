{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    signing.key = "A4AB76840BB2901A";
    #      signing.signByDefault = true;
    settings = {
      user = {
        name = "Marin Kitagawa";
        email = "49131888+Marin-Kitagawa@users.noreply.github.com";
      };
      # Sign all commits using ssh key
      commit.gpgsign = true;
      #        gpg.format = "ssh";
      #        user.signingkey = "./id_ed25519.pub";
      #        gpg.ssh.allowedSignersFile = "./allowed_signers";
      credential.helper = "libsecret";

      #git-delta configuration
      core = {pager = "delta";};
      interactive = {diffFilter = "delta --color-only";};
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
        true-color = "always";
      };
      merge = {conflictstyle = "diff3";};
      diff = {colorMoved = "default";};
    };
    includes = [
      {
        path = "~/.gitconfig-work";
        condition = "hasconfig:remote.*.url:git@github.com:q-rounds/**";
      }
    ];
  };
}
