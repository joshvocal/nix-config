{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Josh Vocal";
    userEmail = "joshvocal@gmail.com";

    extraConfig = {
      fetch = { prune = true; };
      filter = {
        lfs = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
      pull = { rebase = true; };
      init = { defaultBranch = "main"; };
    };

    ignores = [ "**/.DS.Store" "*.idea" "*.env" ];

    aliases = {
      a = "add .";
      aa = "add -A";
      br = "branch";
      brs = "branch --sort=-committerdate";
      ame = "! git add .; git commit --amend --no-edit";
      cm = "! git add .; git commit -m";
      co = "checkout";
      cob = "checkout -b";
      c = "clone";
      d = "diff";
      dc = "diff --cached";
      l = "log --abbrev-commit";
      lb =
        "git reflog show --pretty=format:'%gs ~ %gd' --date=relative | grep 'checkout:' | grep -oE '[^ ]+ ~ .*' | awk -F~ '!seen[$1]++' | head -n 10 | awk -F' ~ HEAD@{' '{printf(\"  \\033[33m%s: \\033[37m %s\\033[0m\\n\", substr($2, 1, length($2)-1), $1)}'";
      p = "pull";
      pf = "push --force-with-lease";
      pre = "! git fetch --all --prune; git pull --rebase origin main";
      rb = "!f() { git rebase -i HEAD~$1; }; f";
      ri = "rebase -i";
      rh = "reset --hard origin/main";
      s = "status";
      st = "stash --include-untracked";
      v = "!gh repo view --web";
    };

  };
}
