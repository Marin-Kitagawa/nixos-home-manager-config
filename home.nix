{ config, pkgs, ... }:

let 
  unstable = import <unstable> { config = {allowUnfree = true; }; };
in {
  home.packages = with unstable; [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello
    btop
    gradle
    jdk22
    mono
    nodePackages_latest.nodejs
    onlyoffice-bin_latest
    yarn-berry
# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
  ];
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "shenhe";
  home.homeDirectory = "/home/shenhe";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
  programs = {
    zsh = {
      enable = true;
      plugins = [
      {
        name = "enhancd";
        file = "enhancd.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "Marin-Kitagawa";
          repo = "enhancd";
          rev = "657525aed3dcaf78d663f781316d7b222bd053e9";
          sha256 = "i2/H59I59eE1v2KoNJGt9aQUuM1YKU+XPU/QMtRNRCI=";
        };
      }
      {
        name = "calc.plugin.zsh";
        file = "calc.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "arzzen";
          repo = "calc.plugin.zsh";
          rev = "5b4c85977b693c15eb052cde6b5cef0d6610f567";
          sha256 = "N4FBN7iyyiEyZX/opj63D5acA1Oh0YpFXdz83oIOWPE=";
        };
      }
      {
        name = "send.plugin.zsh";
        file = "send.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "robertzk";
          repo = "send.zsh";
          rev = "d1291eb8900c2f9ebbc2b977b1ba67e2681c1b28";
          sha256 = "ss4526z8G5WgeoC6s8+1K7MYWs5BsXxd8+I6wROwDAo=";
        };
      }
      {
        name = "fzf-marks.plugin.zsh";
        file = "fzf-marks.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "urbainvaes";
          repo = "fzf-marks";
          rev = "08cc34a3668c0f7022d55e0e2d3270fa429b3390";
          sha256 = "qVOAoCtOpQeVo4W00NIOHadrnbwP/GCHVnVoH0kwEgM=";
        };
      }
      {
        name = "functional.plugin.zsh";
        file = "functional.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "Tarrasch";
          repo = "zsh-functional";
          rev = "cb44a61cd38599f794a09f44c0a46cddbb725b2a";
          sha256 = "Vc/E/ERenr9BkhM/P28ZjTfAsg3ayJ7accVrNFR1jnc=";
        };
      }
#      {
#        name = "vi-mode";
#        file = "zsh-vi-mode.plugin.zsh";
#        src = pkgs.fetchFromGitHub {
#          owner = "jeffreytse";
#          repo = "zsh-vi-mode";
#          rev = "287efa19ec492b2f24bb93d1f4eaac3049743a63";
#          sha256 = "HMfC4s7KW4bO7H6RYzLnSARoFr1Ez89Z2VGONKMpGbw=";
#        };
#      }
      {
        name = "history-search-multi-word";
        file = "history-search-multi-word.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "history-search-multi-word";
          rev = "c4dcddc1cd17e7e0909471703f3526170db0f475";
          sha256 = "KgKm9qzFnwXDXwmTruPgC0tjmiTY5AiGdrWW4zDWUF4=";
        };
      }
      {
        name = "f-sy-h";
        file = "F-Sy-H.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "F-Sy-H";
          rev = "3dea11a9018061e6e3a77e529b79e5654679d3a0";
          sha256 = "AEeGEx2vyyHVS92Nla7XoqSx3rTpQHYwPMrK1jFH1Mg=";
        };
      }
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
          sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
          sha256 = "4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
        };
      }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [
          "cp"
          "wd"
          "git"
          "ruby"
          "emoji"
          "emotty"
          "python"
          "extract"
          "autojump"
          "copyfile"
          "dircycle"
          "encode64"
          "jsontools"
          "git-extras"
          "command-not-found"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
        ];
        theme = "random";
      };
      shellAliases = {
        btop = "btop --utf-force";
        bupskel = "cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)";
        cls = "clear";
        df = "df -h";
        egrep = "egrep --color=auto";
        fgrep = "fgrep --color=auto";
        fix-gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify";
        fix-gpg-retrieve = "gpg2 --keyserver-options auto-key-retrieve --receive-keys";
        free = "free -mt";
        give-me-azerty-be = "sudo localectl set-x11-keymap be";
        give-me-qwerty-us = "sudo localectl set-x11-keymap us";
        gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify";
        gpg-retrieve = "gpg2 --keyserver-options auto-key-retrieve --receive-keys";
        grep = "grep --color=auto";
        gs = "git status";
        hw = "hwinfo --short";
        jctl = "journalctl -p 3 -xb";
        l = "eza --icons --long --all --group-directories-first --git --header";
        ll = "eza --icons --long --all --group-directories-first --git --header";
        ls = "eza --icons --long --all --group-directories-first --git --header";
        md = "mkdir -p";
        merge = "xrdb -merge ~/.Xresources";
        microcode = "grep . /sys/devices/system/cpu/vulnerabilities/*";
        nz = "nvim ~/.zshrc";
        pdw = "pwd";
        podimg = "podman images";
        podnames = "podimg | awk 'match(\$1, /\w+$/) {print substr(\$1, RSTART, RLENGTH)}'";
        podtags = "podimg | awk '{print \$2}'";
        probe = "sudo -E hw-probe -all -upload";
        psa = "ps auxf";
        psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
        rg = "rg --sort path";
        rip = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl";
        riplong = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl";
        rmrf = "rm -rf";
        skel = "[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~";
        sr = "sudo reboot";
        ssn = "sudo shutdown now";
        sysfailed = "systemctl list-units --failed";
        sz = "source ~/.zshrc";
        unhblock = "hblock -S none -D none";
        update-fc = "sudo fc-cache -fv";
        update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
        userlist = "cut -d: -f1 /etc/passwd";
        wget = "wget -c";
        yta-aac = "yt-dlp --extract-audio --audio-format aac ";
        yta-best = "yt-dlp --extract-audio --audio-format best ";
        yta-flac = "yt-dlp --extract-audio --audio-format flac ";
        yta-mp3 = "yt-dlp --extract-audio --audio-format mp3 ";
        ytv-best = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4";
        rmgitcache = "rm -r ~/.cache/git";
      };
      initExtra = ''
        clear
        mcd () {
          mkdir -p $1
            cd $1
        }
      '';
    };
    git = {
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
  };

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/shenhe/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.enableNixpkgsReleaseCheck = false;
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
}
