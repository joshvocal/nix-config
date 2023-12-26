{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      esbenp.prettier-vscode
      eamodio.gitlens
      ms-vscode-remote.remote-ssh
      github.copilot
    ];
    userSettings = {
      "telemetry.telemetryLevel" = "off";
      "update.showReleaseNotes" = false;
      "git.mergeEditor" = true;

      "window.titleBarStyle" = "custom";

      "vim.insertModeKeyBindings" = [{
        before = [ "j" "j" ];
        after = [ "<Esc>" ];
      }];

      "vim.handleKeys" = { "<C-f>" = true; };

      "files.exclude" = {
        "**/.DS_Store" = true;
        "**/node_modules/" = true;
        "**/package-lock.json" = true;
        "**/yarn.lock" = true;
        "**/dist/**" = true;
        "**/.git" = true;
      };

      "editor.lineHeight" = 22;
      "editor.inlineSuggest.enabled" = true;
      "editor.formatOnPaste" = true;
      "editor.fontFamily" = "'Monaspace Neon', monospace";
      "editor.fontLigatures" = "'ss01', 'ss03', 'ss06', 'calt'";
      "editor.fontWeight" = 400;
      "editor.fontSize" = 14;
      "editor.renderWhitespace" = "trailing";
      "editor.accessibilitySupport" = "off";
      "editor.codeLens" = false;
      "editor.copyWithSyntaxHighlighting" = false;
      "editor.emptySelectionClipboard" = false;
      "editor.rulers" = [ 80 ];
      "editor.scrollBeyondLastLine" = false;

      "workbench.settings.editor" = "json";
      "workbench.colorTheme" = "Darcula";
      "workbench.list.smoothScrolling" = true;
      "workbench.fontAliasing" = "antialiased";
      "workbench.tips.enabled" = false;
      "workbench.startupEditor" = "none";
      "workbench.preferredDarkColorTheme" = "Darcula";
      "workbench.preferredHighContrastColorTheme" = "Darcula";
      "workbench.statusBar.visible" = false;
      "workbench.editor.showTabs" = "single";
      "workbench.tree.renderIndentGuides" = "onHover";

      "terminal.integrated.fontFamily" = "'Monaspace Neon', monospace";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontWeight" = 300;
      "terminal.integrated.fontWeightBold" = 300;
      "terminal.integrated.lineHeight" = 1.5;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyleInactive" = "underline";
      "terminal.integrated.gpuAcceleration" = "on";

      "workbench.colorCustomizations" = {
        "editorRuler.foreground" = "#ffffff10";
        "terminal.background" = "#171C19";
        "terminal.foreground" = "#87928A";
        "terminalCursor.background" = "#87928A";
        "terminalCursor.foreground" = "#87928A";
        "terminal.ansiBlack" = "#171C19";
        "terminal.ansiBlue" = "#478C90";
        "terminal.ansiBrightBlack" = "#5F6D64";
        "terminal.ansiBrightBlue" = "#478C90";
        "terminal.ansiBrightCyan" = "#1C9AA0";
        "terminal.ansiBrightGreen" = "#489963";
        "terminal.ansiBrightMagenta" = "#55859B";
        "terminal.ansiBrightRed" = "#B16139";
        "terminal.ansiBrightWhite" = "#ECF4EE";
        "terminal.ansiBrightYellow" = "#A07E3B";
        "terminal.ansiCyan" = "#1C9AA0";
        "terminal.ansiGreen" = "#489963";
        "terminal.ansiMagenta" = "#55859B";
        "terminal.ansiRed" = "#B16139";
        "terminal.ansiWhite" = "#87928A";
        "terminal.ansiYellow" = "#A07E3B";
      };
    };
  };
}
