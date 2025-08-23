{ pkgs, ...}:

{
    enable = true;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    prefix = "C-b";

    plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        resurrect
        continuum
    ];
    extraConfig = ''
        set -as terminal-features ",xterm-256color:RGB"
        set -g mouse on
        set -g default-command ${pkgs.zsh}/bin/zsh

        set -g status-position top
        set -g status-justify centre

        set -g status-right ""
        set -g status-left "#S "
        set -g status-style "bg=default,fg=#a89984"
        set -g window-status-format "#[fg=#a89984]#I:#W"
        set -g window-status-current-format "#[fg=#fabd2f,bold]#I:#W"
        set -g message-style "bg=#3c3836,fg=#ebdbb2"
        set -g message-command-style "bg=#3c3836,fg=#ebdbb2"

        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '15'
    '';
}
