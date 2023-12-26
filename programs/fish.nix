{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      alias h='history'
      alias ..='cd ..'
      alias ...='cd ../..'
      alias ....='cd ../../..'
      alias g="git"
    '';
  };
}
