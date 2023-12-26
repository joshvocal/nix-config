{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = false;
    initExtra = ''
      alias ls='ls -G'
      alias ll='ls -l -G'
      alias lla='ls -la -G'
      alias h='history'
      alias ..='cd ..'
      alias ...='cd ../..'
      alias ....='cd ../../..'
      alias g="git"
    '';
  };
}
