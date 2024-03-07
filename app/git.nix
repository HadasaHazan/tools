# GIT

pkgs:
{
  enable = true;
  userName = "Your Name";
  userEmail = "name@name.io";
  ignores = [ "*.iml" ".idea/" ".vscode" ];
  signing = {
      key = "name@name.io";
      signByDefault = false;
    };
  extraConfig = {
    core.editor = "vi";
    github.username = "name";
    pull.rebase = false;    # this create a commit when merging from remote
  };
  aliases = {
    ci = "commit -s";
    cim = "commit -s -m";
    cin = "commit -s -n";
    aa = "add .";
    a = "add";
    pl = "pull";
    ps = "push";
    psu = "push -u origin HEAD";
    psf = "push --force-with-lease";
    me = "merge";
    l1 = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    l2 = "log --graph --abbrev-commit --decorate=no --date=format:'%Y-%m-%d %H:%I:%S' --format=format:'%C(03)%>|(26)%h%C(reset)  %C(04)%ad%C(reset)  %C(green)%<(16,trunc)%an%C(reset)  %C(bold 1)%d%C(reset) %C(bold 0)%>|(1)%s%C(reset)' --all";
    l3 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    l4 = "lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
    co = "checkout";
    br = "branch";
    st = "status";
    last = "log -l HEAD";
  };
}
