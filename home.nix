{ config, pkgs, ... }:

{
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
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
        }
      }
      {
        name = "calc.plugin.zsh";
        file = "calc.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "arzzen";
          repo = "calc.plugin.zsh";
        }
      }
      {
        name = "send.plugin.zsh";
        file = "send.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "robertzk";
          repo = "send.zsh";
        }
      }
      {
        name = "fzf-marks.plugin.zsh";
        file = "fzf-marks.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "urbainvaes";
          repo = "fzf-marks";
        }
      }
      {
        name = "functional.plugin.zsh";
        file = "functional.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "Tarrasch";
          repo = "zsh-functional";
        }
      }
      {
        name = "vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
        }
      }
      {
        name = "history-search-multi-word";
        file = "history-search-multi-word.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "history-search-multi-word";
        }
      }
      {
        name = "f-sy-h";
        file = "F-Sy-H.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "F-Sy-H";
        }
      }
    ]
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
      ]
      theme = "random"
    }
    shellAliases = {
      bupskel = "cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)"
      cd.. = "cd .."
      cls = "clear";
      df = "df -h"
      egrep = "egrep --color=auto"
      fgrep = "fgrep --color=auto"
      fix-gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify"
      fix-gpg-retrieve = "gpg2 --keyserver-options auto-key-retrieve --receive-keys"
      free = "free -mt"
      give-me-azerty-be = "sudo localectl set-x11-keymap be"
      give-me-qwerty-us = "sudo localectl set-x11-keymap us"
      gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify"
      gpg-retrieve = "gpg2 --keyserver-options auto-key-retrieve --receive-keys"
      grep = "grep --color=auto"
      hw = "hwinfo --short"
      jctl = "journalctl -p 3 -xb"
      l = "eza --icons --long --all --group-directories-first --git --header"
      ll = "eza --icons --long --all --group-directories-first --git --header"
      ls = "eza --icons --long --all --group-directories-first --git --header"
      md = "mkdir -p"';
      merge = "xrdb -merge ~/.Xresources"
      microcode = "grep . /sys/devices/system/cpu/vulnerabilities/*"
      nz = "nvim ~/.zshrc";
      pdw = "pwd"
      podimg = "podman images"
      podnames = "podimg | awk 'match(\$1, /\w+$/) {print substr(\$1, RSTART, RLENGTH)}'"
      podtags = "podimg | awk '{print \$2}'"
      probe = "sudo -E hw-probe -all -upload"
      psa = "ps auxf"
      psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e"
      rg = "rg --sort path"
      rip = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
      riplong = "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
      rmrf = "rm -rf";
      skel = "[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~"
      sr = "sudo reboot"
      ssn = "sudo shutdown now"
      sysfailed = "systemctl list-units --failed"
      sz = "source ~/.zshrc";
      unhblock = "hblock -S none -D none"
      update-fc = 'sudo fc-cache -fv'
      update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg"
      userlist = "cut -d: -f1 /etc/passwd"
      wget = "wget -c"
      yta-aac = "yt-dlp --extract-audio --audio-format aac "
      yta-best = "yt-dlp --extract-audio --audio-format best "
      yta-flac = "yt-dlp --extract-audio --audio-format flac "
      yta-mp3 = "yt-dlp --extract-audio --audio-format mp3 "
      ytv-best = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"
      rmgitcache = "rm -r ~/.cache/git"
    }

    initExtra = ''
      ghcu () {
          git clone https://github.com/$1
      }

      ghcuc () {
          git clone https://gihub.com/$(xclip -o)
      }

      cls

      ex ()
      {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   tar xf $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }
  ''
  }
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
