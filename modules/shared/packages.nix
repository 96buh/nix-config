{ pkgs }:
with pkgs;
[
    neovim
    mkalias
    tmux
    fzf
    zoxide
    oh-my-posh
    tree
    pdf2svg

    # Github
    gh

    fswatch
    choose-gui
    # Python
    python312
    python312Packages.pip
    fastfetch
    # Nodejs
    nodejs
]

