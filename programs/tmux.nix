{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Lower escape timing from 500ms to 50ms for quicker response to scroll-buffer access.
      set -s escape-time 50
      set-option -g mouse on
      set-option -g default-shell ~/.nix-profile/bin/fish 

      # Pane start at index 1
      set -g base-index 1
      setw -g pane-base-index 1

      # Set prefix to Ctrl-Space
      unbind C-b
      set -g prefix C-Space
      bind Space send-prefix

      # Switch windows with vim arrows
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Resize panes with vim arrows
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Set new panes to open in current directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Reformat window numbers on close
      set-option -g renumber-windows on

      # Increase scrollback lines
      set -g history-limit 10000

      # Don't suspend
      unbind-key C-z

      # Set true terminal colors
      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",xterm-256color*:Tc"

      # Window list in the center
      set -g status-justify absolute-centre
    '';
  };
}
