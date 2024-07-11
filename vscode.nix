{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    mutableExtensionsDir = true;
    extensions = (with pkgs.vscode-extensions; [
        batisteo.vscode-django
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        ms-azuretools.vscode-docker
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        pkief.material-icon-theme
        svelte.svelte-vscode
        vscodevim.vim
        wakatime.vscode-wakatime
        zhuangtongfa.material-theme
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-thunder-client";
          publisher = "rangav";
          version = "2.24.12";
          sha256 = "96dd3a83edd520debb3959d6fbf98f982c46250abf307a0a23d29a830e2aa789";
        }
        {
          name = "mongodb-vscode";
          publisher = "mongodb";
          version = "1.6.0";
          sha256 = "5d9ca4624230bb8af1f60b98a4838f53838f5298b8dfbbbdf0a3fe61f6d2301b";
        }
        {
          name = "sqltools";
          publisher = "mtxr";
          version = "0.28.3";
          sha256 = "6d3ac70218fcbb0cd12089b388ab0e8b365ff3e937b7e56b90e799ac5c7b487f";
        }
        {
          name = "sqltools-driver-pg";
          publisher = "mtxr";
          version = "0.5.4";
          sha256 = "5e73d33053603064f6b497bc5a59a1301dc396ebcc671f447b6c3bc4c0b32d83";
        }
        {
          name = "sqltools-driver-sqlite";
          publisher = "mtxr";
          version = "0.5.1";
          sha256 = "c0581beb00d280f6cfb4454a6c771479446a6d502a0ec10484551c06142d985f";
        }
      ]
    );
    userSettings = {
      "files.autoSave" = "on";

      # Network
      "http.proxySupport" = "off";
      "http.proxyStrictSSL" = false;

      # Styling
      "workbench.colorTheme" = "One Dark Pro Flat";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.fontFamily" = "'FiraCode Nerd Font'";
      "editor.fontLigatures" = true;

      # Other
      "telemetry.telemetryLevel" = "off";
      "update.showReleaseNotes" = false;

      # Whitespace
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;
      "diffEditor.ignoreTrimWhitespace" = false;

      # Git
      "git.enableCommitSigning" = true;
      "git-graph.repository.sign.commits" = true;
      "git-graph.repository.sign.tags" = true;
      "git-graph.repository.commits.showSignatureStatus" = true;

      # Window
      "window.customTitleBarVisibility" = "windowed";
      "window.dialogStyle" = "custom";
      "window.menuBarVisibility" = "hidden";
      "window.titleBarStyle" = "custom";
    };
  };
}
