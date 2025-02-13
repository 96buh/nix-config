{ pkgs, ...}:

{
    enable = true;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
        gruvbox
        sensible
        vim-tmux-navigator
    ];
    extraConfig = ''
        set -as terminal-features ",xterm-256color:RGB"
        set -g mouse on
        set -g default-command ${pkgs.zsh}/bin/zsh

        set-option -g status-position top
    '';
}
