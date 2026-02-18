{
  programs.zsh.shellAliases = {
    cls = "clear";
    md = "mkdir -p";
    pdw = "pwd";
    psa = "ps auxf";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
    rmrf = "rm -rf";
    sr = "sudo reboot";
    ssn = "sudo shutdown now";
    sysfailed = "systemctl list-units --failed";
    update-fc = "sudo fc-cache -fv";
    update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
  };
}
